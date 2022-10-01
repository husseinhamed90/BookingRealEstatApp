import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

part 'sliders_state.dart';

class SlidersCubit extends Cubit<SlidersState> {
  SlidersCubit() : super(SlidersInitial());
  double ?initAdultsNumber=1.0;
  double ?initRoomsNumber=1.0;
  SfRangeValues pricesValues=const SfRangeValues(0.0, 10000.0);

  TextEditingController priceController = TextEditingController();
  TextEditingController guestsController = TextEditingController();
  TextEditingController numberOfRoomsController = TextEditingController();

  void updateInitValue(double newValue,String valueName){
    if(valueName =="Rooms"){
      initRoomsNumber=newValue;
      numberOfRoomsController.text=initRoomsNumber.toString();
    }
    else{
      initAdultsNumber=newValue;
      guestsController.text=initAdultsNumber.toString();
    }
    emit(SlidersChangedSate());
  }
  void updateSliderRangeValue(SfRangeValues newValue){
    pricesValues=newValue;
    int start =double.parse(pricesValues.start.toString()).toInt();
    int end =double.parse(pricesValues.end.toString()).toInt();
    print(end);
    if(end==pricesValues.end){
      priceController.text="$start - Max";
    }
    else{
      priceController.text="$start - $end";
    }

    emit(SlidersChangedSate());
  }
}
