
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/Core/AppTheme/AppColors.dart';
import 'package:realestate/Features/HomePageLayout/HomePageLayoutPage.dart';
import 'package:realestate/Features/SearchFilters/data/remote/data_sources/RemoteDataSource.dart';
import 'package:realestate/Features/SearchFilters/presentation/manager/filters_bloc.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelModel.dart';
import '../../../../../Core/ResuableWidgets/BottomNavBar.dart';
import '../../../../../Core/ResuableWidgets/BuildItem.dart';
import '../../../../../Core/ReusableComponantes.dart';
import '../../../../../DependencyInjection.dart';
import '../../../../Authentication/presentation/pages/SignIn/SignInWidgets/CustomTextField.dart';
import '../../../../FlatDetails/presentation/pages/ItemDetailes.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class SearchResults extends StatefulWidget {
  List<HotelModel> hotels;
  SearchResults({Key? key,required this.hotels}) : super(key: key);

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("GET MORE");
        //dl<FilteringBloc>().add(FetchMore());

        dl<RemoteDataSource>().filterResults(numberOfRooms: 1, pageNumber: dl<FilteringBloc>().pageNumber, cheekIn: dl<FilteringBloc>().startDateController.text,
            checkOut: dl<FilteringBloc>().endDateController.text, numberOfAdults: 1, minPrice: 10, maxPrice: 10000, locationModel: dl<FilteringBloc>().state.locations![0]).fold((left) {

        }, (right) {
              setState(() {
                dl<FilteringBloc>().pageNumber++;
                widget.hotels+=right;
              });
        });
      }
    });
  }
// update in API CALL
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: const BottomNavBar(isInHomeScreen: false),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePageLayoutPage(),));
            },
            child: const Icon(Icons.arrow_back_outlined)),
        centerTitle: true,
        title: const Text("SEARCH RESULTS"),
      ),

      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Container(
                color:primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: CustomTextField(isSecure: false,isClickable: false,controller: dl<FilteringBloc>().locationController ,iconName: "Assets/Icons/searchbar.svg",hindText: dl<FilteringBloc>().locationController.text,readOnly: true,haveBorder: false,textAlign: TextAlign.left),
                )
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20.h,),
          ),
          SliverPadding(
              padding: EdgeInsets.only(right: 20.w,left: 20.w),
              sliver: BlocConsumer<FilteringBloc,FilteringState>(
                builder: (context, state) {
                  return SliverList(delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            if(index==widget.hotels.length){
                              return SizedBox(
                                  height: 40.w,
                                  width: 40.w,
                                  child: const Center(child: CircularProgressIndicator(color: primaryColor),));
                            }
                            else{
                              return BuildItem(bottomPaddingValue: 0,hotelModel: widget.hotels[index],);
                            }
                      },childCount:widget.hotels.length+1)
                  );
                },
                listener: (context, state) {

                },
              )
          )
        ],
      ),

    );
  }
}

