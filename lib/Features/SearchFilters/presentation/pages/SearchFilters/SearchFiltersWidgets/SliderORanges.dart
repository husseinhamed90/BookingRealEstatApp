import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/Features/SearchFilters/presentation/manager/sliders_cubit.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../../../../Authentication/presentation/pages/SignIn/SignInWidgets/CustomTextField.dart';
import 'BuildSliderRange.dart';
import 'BuildSliderWithoutRange.dart';

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
                child: (isSliderRange!) ?
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


