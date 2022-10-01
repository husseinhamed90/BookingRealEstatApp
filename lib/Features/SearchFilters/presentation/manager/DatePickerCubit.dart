import 'package:bloc/bloc.dart';

part 'DatePickerState.dart';

class DatePickerCubit extends Cubit<DatePickerState> {
  DateTime ?startData;
  DateTime ?endData;
  DatePickerCubit() : super(SliderRangeInitial());
  void setStartDate(DateTime dateTime){
    startData=dateTime;
    emit(StartDataFilled());
  }

  void setEndDate(DateTime dateTime){
    endData=dateTime;
    emit(EndDataFilled());
  }
}
