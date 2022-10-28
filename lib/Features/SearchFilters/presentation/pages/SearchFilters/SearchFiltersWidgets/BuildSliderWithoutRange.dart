import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../../../../../Core/AppTheme/AppColors.dart';
import '../../../../../../DependencyInjection.dart';
import '../../../manager/sliders_cubit.dart';

class BuildSliderWithoutRange extends StatelessWidget {
  double min;
  double initValue;
  double max;
  TextEditingController controller;
  double interval;
  String hintText;
  String varName="";
  BuildSliderWithoutRange({Key? key,required this.varName,required this.initValue,required this.controller,required this.min,required this.max,required this.interval,required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SfSlider(
      min: min,
      onChangeStart: (value) {
        dl<SlidersCubit>().updateInitValue(value,varName);
        controller.text= initValue.toInt().toString();
      },
      onChangeEnd: (value) {
        dl<SlidersCubit>().updateInitValue(value,varName);
        controller.text= initValue.toInt().toString();
      },
      max: max,
      inactiveColor: const Color(0xffF2F2F2),
      activeColor: primaryColor,
      value:  initValue,
      interval: interval,
      showTicks: false,
      showLabels: false,
      enableTooltip: false,
      minorTicksPerInterval: 1,
      onChanged: (dynamic value){
        dl<SlidersCubit>().updateInitValue(value,varName);
      },
    );
  }
}
