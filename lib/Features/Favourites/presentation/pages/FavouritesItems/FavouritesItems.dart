import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/Core/AppTheme/AppColors.dart';
import '../../../../../Core/AppTheme/Strings.dart';
import '../../../../../Core/ResuableWidgets/BuildItem.dart';
import '../../../../../Core/ReusableComponantes.dart';
import '../../../../Rooms/presentation/widgets/UpperSection.dart';
import '../../manager/FavouriteBloc/favourites_bloc.dart';


class FavouritesItemsPage extends StatelessWidget {
  const FavouritesItemsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text(favouritesAppbarTitle),
      ),
      body: BlocBuilder<FavouriteBloc,FavouriteState>(
        builder: (context, state) {
          return  CustomScrollView(
            slivers: [
              UpperSection(title: favoriteItemsTitle, subTitle:"You have ${state.favouritesList!.length} Hotel In Your Favourite List"),
              SliverToBoxAdapter(
                child: SizedBox(height: 20.h,),
              ),
              BlocBuilder<FavouriteBloc,FavouriteState>(
                builder: (context, state) {
                  return SliverPadding(
                    padding: EdgeInsets.only(right: 20.w,left: 20.w),
                    sliver: SliverList(delegate: SliverChildBuilderDelegate((context, index) {
                      return BuildItem(bottomPaddingValue: 20,hotelModel: state.favouritesList![index],width: null,);
                    },childCount: state.favouritesList!.length)),
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }
}
