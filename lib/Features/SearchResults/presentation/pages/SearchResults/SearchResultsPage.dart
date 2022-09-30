
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/Core/AppTheme/AppColors.dart';
import 'package:realestate/Features/HomePageLayout/HomePageLayoutPage.dart';
import 'package:realestate/Features/SearchFilters/presentation/manager/filters_bloc.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelModel.dart';
import '../../../../../Core/ResuableWidgets/BottomNavBar.dart';
import '../../../../../Core/ResuableWidgets/BuildItem.dart';
import '../../../../../Core/ReusableComponantes.dart';
import '../../../../../DependencyInjection.dart';
import '../../../../Authentication/presentation/pages/SignIn/SignInWidgets/CustomTextField.dart';
import '../../../../FlatDetails/presentation/pages/ItemDetailes.dart';


class SearchResults extends StatelessWidget {
  final List<HotelModel> hotels;
  const SearchResults({Key? key,required this.hotels}) : super(key: key);

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
        slivers: [
          SliverToBoxAdapter(
            child: Container(
                color:primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: CustomTextField(isClickable: false,controller: dl<FilteringBloc>().locationController ,iconName: "Assets/Icons/searchbar.svg",hindText: dl<FilteringBloc>().locationController.text,readOnly: true,haveBorder: false,textAlign: TextAlign.left),
                )
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20.h,),
          ),
          SliverPadding(
              padding: EdgeInsets.only(right: 20.w,left: 20.w),
              sliver: SliverList(delegate: SliverChildBuilderDelegate((context, index) {
                return BuildItem(bottomPaddingValue: 0,hotelModel: hotels[index],);
              },childCount: hotels.length))
          )
        ],
      ),

    );
  }
}

