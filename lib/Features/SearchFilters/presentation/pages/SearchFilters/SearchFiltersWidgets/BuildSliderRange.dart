import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../../../Core/AppTheme/AppColors.dart';
import '../../../../../../DependencyInjection.dart';
import '../../../manager/sliders_cubit.dart';

class BuildSliderRange extends StatelessWidget {
  SfRangeValues values;
  double min;
  double max;
  TextEditingController controller;
  double interval;
  String hintText;
  BuildSliderRange({Key? key,required this.controller,required this.values,required this.min,required this.max,required this.interval,required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfRangeSlider(
      min: min,
      onChangeEnd: (value) {
        //print(value);
      },
      onChangeStart: (value) {

      },
      inactiveColor: const Color(0xffF2F2F2),
      activeColor: primaryColor,
      max: max,
      values:  values,
      interval: interval,
      showTicks: false,
      showLabels: false,
      enableTooltip: false,
      minorTicksPerInterval: 100,
      onChanged: (SfRangeValues values){
        dl<SlidersCubit>().updateSliderRangeValue(values);
      },
    );
  }
}