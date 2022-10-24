
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/Core/AppTheme/AppColors.dart';
import 'package:realestate/Features/HomePageLayout/HomePageLayoutPage.dart';
import 'package:realestate/Features/SearchFilters/data/remote/data_sources/RemoteDataSource.dart';
import 'package:realestate/Features/SearchFilters/presentation/manager/filters_bloc.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelModel.dart';
import '../../../../../Core/AppTheme/Strings.dart';
import '../../../../../Core/ResuableWidgets/BottomNavBar.dart';
import '../../../../../Core/ResuableWidgets/BuildItem.dart';
import '../../../../../DependencyInjection.dart';
import '../../../../Authentication/presentation/pages/SignIn/SignInWidgets/CustomTextField.dart';


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
    super.initState();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        dl<RemoteDataSource>().moreHotelsResponse().fold((left) {},(right) {
          setState(() {
            dl<FilteringBloc>().pageNumber++;
            widget.hotels+=right;
          });
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: const BottomNavBar(isInHomeScreen: false),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePageLayoutPage(),));
            },
            child: const Icon(Icons.arrow_back_outlined)),
        centerTitle: true,
        title:  const Text(searchResults),
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
                            print("index");
                            print(widget.hotels.length);
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
                listener: (context, state) {},
              )
          )
        ],
      ),
    );
  }
}

