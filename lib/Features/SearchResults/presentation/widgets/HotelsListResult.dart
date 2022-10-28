import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/AppTheme/AppColors.dart';
import '../../../../Core/ResuableWidgets/BuildItem.dart';
import '../../../SearchFilters/presentation/manager/filters_bloc.dart';
import '../../../SearchForm/data/remote/models/HotelModel.dart';

class HotelsListResult extends StatelessWidget {
  final List<HotelModel> hotels;
  const HotelsListResult({required this.hotels,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: EdgeInsets.only(right: 20.w,left: 20.w),
        sliver: BlocConsumer<FilteringBloc,FilteringState>(
          builder: (context, state) {
            return SliverList(delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  if(index==hotels.length){
                    return SizedBox(
                        height: 40.w,
                        width: 40.w,
                        child: const Center(child: CircularProgressIndicator(color: primaryColor),));
                  }
                  else{
                    return BuildItem(bottomPaddingValue: 0,hotelModel: hotels[index],);
                  }
                },childCount:hotels.length+1)
            );
          },
          listener: (context, state) {},
        )
    );
  }
}