import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../Core/AppTheme/Strings.dart';

part 'sliders_state.dart';

class SlidersCubit extends Cubit<SlidersState> {
  SlidersCubit() : super(SlidersInitial());
  int ?initAdultsNumber=1;
  int ?initRoomsNumber=1;
  SfRangeValues pricesValues=const SfRangeValues(10.0, 10000.0);

  TextEditingController priceController = TextEditingController();
  TextEditingController guestsController = TextEditingController();
  TextEditingController numberOfRoomsController = TextEditingController();

  void updateInitValue(double newValue,String valueName){

    if(valueName ==roomsLabel){
      initRoomsNumber=newValue.toInt();
      numberOfRoomsController.text=initRoomsNumber.toString();
    }
    else{
      initAdultsNumber=newValue.toInt();
      guestsController.text=initAdultsNumber.toString();
    }
    emit(SlidersChangedSate());
  }
  void updateSliderRangeValue(SfRangeValues newValue){
    pricesValues=newValue;
    int start =double.parse(pricesValues.start.toString()).toInt();
    int end =double.parse(pricesValues.end.toString()).toInt();
    if(end==pricesValues.end){
      priceController.text="$start - Max";
    }
    else{
      priceController.text="$start - $end";
    }

    emit(SlidersChangedSate());
  }
}
