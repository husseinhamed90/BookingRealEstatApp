import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/Core/AppTheme/AppColors.dart';
import 'package:realestate/Features/FlatDetails/presentation/manager/favourite_cubit.dart';
import '../../../../../Core/ResuableWidgets/BuildItem.dart';
import '../../../../../Core/ReusableComponantes.dart';
import '../../../../../DependencyInjection.dart';
import '../../../../SearchForm/data/remote/models/HotelModel.dart';

class FavouritesItemsPage extends StatelessWidget {
  List<HotelModel>?hotels;
  FavouritesItemsPage({Key? key,this.hotels}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FAVORITES"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: getColumn(firstString: "Your favorite items",secondString: "You have 98 favorite flats and 13 homes"),
                  ),
                  SizedBox(height: 20.h,)
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20.h,),
          ),
          BlocBuilder<FavouriteCubit,FavouriteState>(
            builder: (context, state) {
              return SliverPadding(
                padding: EdgeInsets.only(right: 20.w,left: 20.w),
                sliver: SliverList(delegate: SliverChildBuilderDelegate((context, index) {
                  return BuildItem(bottomPaddingValue: 20,hotelModel: dl<FavouriteCubit>().favourites[index],width: null,);
                },childCount: dl<FavouriteCubit>().favourites.length)),
              );
            },
          )
        ],
      ),

    );
  }
}
