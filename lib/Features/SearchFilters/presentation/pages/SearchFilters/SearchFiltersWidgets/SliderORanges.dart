import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/Core/AppTheme/AppColors.dart';
import 'package:realestate/Features/SearchFilters/presentation/manager/sliders_cubit.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../../../DependencyInjection.dart';
import '../../../../../Authentication/presentation/pages/SignIn/SignInWidgets/CustomTextField.dart';
import '../../../manager/filters_bloc.dart';

class SliderOfRanges extends StatelessWidget {
  double min;
  double max;
  TextEditingController controller;
  double interval;
  bool ?isSliderRange;
  String hintText;
  String varName;
  SfRangeValues ?values;
  double ?initValue;
  SliderOfRanges({Key? key,this.initValue,this.values,this.varName="",required this.controller,required this.isSliderRange,required this.min,required this.max,required this.interval,required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<SlidersCubit,SlidersState>(
          builder: (context, state) {
            return Expanded(
                flex :2,
                child: (isSliderRange!)?
                BuildSliderRange(values: values!,controller: controller,hintText: hintText,max: max,interval: interval,min: min,):
                BuildSliderWithoutRange(varName: varName,initValue: initValue!,controller: controller,hintText: hintText,max: max,interval: interval,min: min,)
            );
          },
        ),
        SizedBox(width: 20.w,),
        Expanded(flex: 1,child: CustomTextField(isSecure: false,isClickable: false,controller:  controller,iconName: "Assets/Icons/searchbar.svg",hindText: hintText,readOnly: true,haveBorder: true,textAlign: TextAlign.center,haveIcon: false,)),
      ],
    );
  }
}

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
        controller.text= initValue.toInt().toString();
      },
    );
  }
}