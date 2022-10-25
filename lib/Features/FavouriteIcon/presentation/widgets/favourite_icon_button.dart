import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:realestate/Core/AppTheme/AppColors.dart';

import '../../../../Core/AppTheme/Strings.dart';
import '../../../SearchForm/domain/entities/Hotel.dart';
import '../manager/FavouriteIconCubit/favourite_cubit.dart';

class FavouriteIconButton extends StatelessWidget {
  final Hotel hotelModel;
  const FavouriteIconButton({Key? key,required this.hotelModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      right: 15.w,
      top: 15.w,
      child: GestureDetector(
        onTap: () {
          context.read<FavouriteCubit>().updateList(hotelModel);
        },
        child: BlocBuilder<FavouriteCubit,FavouriteState>(
          builder: (context, state) {
            if(state.message=="Loading"){
              return SizedBox(
                  height: 15.h,width: 15.h,
                  child: const Center(child: CircularProgressIndicator(color: primaryColor),)
              );
            }
            return Card(
              elevation: 0.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              child:  Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  height: 40.h,width: 40.h,
                  child: Padding(
                    padding:  EdgeInsets.all(12.h),
                    child: SvgPicture.asset(fillHeartIconAsset,color: context.read<FavouriteCubit>().getCorrectIconColor(hotelModel)),
                  )
              ),
            );
          },
        ),
      ),
    );
  }
}
