import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/AppTheme/Strings.dart';
import '../../../../Core/ReusableComponantes.dart';
import '../../../../DependencyInjection.dart';
import '../../../Authentication/presentation/pages/SignIn/SignInWidgets/CustomTextField.dart';
import '../manager/filters_bloc.dart';
import '../manager/sliders_cubit.dart';
import '../pages/SearchFilters/SearchFiltersWidgets/SliderORanges.dart';

class FiltersFields extends StatelessWidget {
  const FiltersFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          drawLabelText(locationLabel),
          SizedBox(
            height: 6.h,
          ),
          CustomTextField(
              isSecure: false,
              isClickable: false,
              iconName: searchFieldIcon,
              hindText: locationFieldHint,
              readOnly: false,
              haveBorder: true,
              textAlign: TextAlign.left,
              controller: dl<FilteringBloc>().locationController,
              haveIcon: true),
          SizedBox(
            height: 20.h,
          ),
          drawLabelText(chooseStartDate),
          SizedBox(
            height: 6.h,
          ),
          CustomTextField(
              isSecure: false,
              isClickable: true,
              iconName: dateFieldIcon,
              hindText: chooseStartDate,
              readOnly: true,
              haveBorder: true,
              textAlign: TextAlign.left,
              controller: dl<FilteringBloc>().startDateController,
              haveIcon: true),
          SizedBox(
            height: 20.h,
          ),
          drawLabelText(chooseEndDate),
          SizedBox(
            height: 6.h,
          ),
          CustomTextField(
              isSecure: false,
              isClickable: true,
              iconName: dateFieldIcon,
              hindText: chooseEndDate,
              readOnly: true,
              haveBorder: true,
              textAlign: TextAlign.left,
              controller: dl<FilteringBloc>().endDateController,
              haveIcon: true),
          SizedBox(
            height: 6.h,
          ),
          drawLabelText(priceLabel),
          BlocBuilder<SlidersCubit,SlidersState>(
            builder: (context, state) {
              return SliderOfRanges(
                  values: dl<SlidersCubit>().pricesValues,
                  isSliderRange: true,
                  min: 10,
                  interval: 10,
                  max: 10000,
                  hintText: priceRange,
                  controller: dl<SlidersCubit>().priceController);
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          drawLabelText(guestsLabel),
          BlocBuilder<SlidersCubit,SlidersState>(
            builder: (context, state) {
              return  SliderOfRanges(
                  initValue: dl<SlidersCubit>().initAdultsNumber!.toDouble(),
                  isSliderRange: false,
                  min: 1,
                  interval: 1,
                  max: 10,
                  hintText: adultsRange,
                  controller: dl<SlidersCubit>().guestsController);
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          drawLabelText(roomsLabel),
          BlocBuilder<SlidersCubit,SlidersState>(
            builder: (context, state) {
              return  SliderOfRanges(
                  initValue: dl<SlidersCubit>().initRoomsNumber!.toDouble(),
                  varName: roomsLabel,
                  isSliderRange: false,
                  min: 1,
                  interval: 2,
                  max: 10,
                  hintText: roomsRange,
                  controller: dl<SlidersCubit>().numberOfRoomsController);
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            height: 60.h,
            width: double.infinity,
            child: ElevatedButton(
              child: const Text(showResults),
              onPressed: () {
                dl<FilteringBloc>().add(FetchLocationsEvent(pageNumber: 0));
              },
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
        ],
      ),
    );
  }
}