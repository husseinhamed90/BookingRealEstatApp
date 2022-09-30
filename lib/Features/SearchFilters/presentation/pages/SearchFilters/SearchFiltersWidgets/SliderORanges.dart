import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/Core/AppTheme/AppColors.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../../../DependencyInjection.dart';
import '../../../../../Authentication/presentation/pages/SignIn/SignInWidgets/CustomTextField.dart';
import '../../../manager/filters_bloc.dart';

class SliderOfRanges extends StatefulWidget {
  SfRangeValues values;
  double min;
  double max;
  TextEditingController controller;
  double interval;
  String hintText;
  SliderOfRanges({Key? key,required this.controller,required this.values,required this.min,required this.max,required this.interval,required this.hintText}) : super(key: key);

  @override
  State<SliderOfRanges> createState() => _SliderOfRangesState();
}

class _SliderOfRangesState extends State<SliderOfRanges> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex :2,
          child: SfRangeSlider(
            min: widget.min,
            onChangeEnd: (value) {
              //print(value);
            },
            onChangeStart: (value) {

            },
            inactiveColor: const Color(0xffF2F2F2),
            activeColor: primaryColor,
            max: widget.max,
            values: widget.values,
            interval: widget.interval,
            showTicks: false,
            showLabels: false,
            enableTooltip: false,
            minorTicksPerInterval: 100,
            onChanged: (SfRangeValues values){
              setState(() {
                widget.values = values;
                int start =double.parse(widget.values.start.toString()).toInt();
                int end =double.parse(widget.values.end.toString()).toInt();
                widget.controller.text="$start - $end";
              });
            },
          ),
        ),
        SizedBox(width: 20.w,),
        Expanded(flex: 1,child: CustomTextField(isClickable: false,controller:  widget.controller,iconName: "Assets/Icons/searchbar.svg",hindText: widget.hintText,readOnly: true,haveBorder: true,textAlign: TextAlign.center,haveIcon: false,)),
      ],
    );
  }
}
