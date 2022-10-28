
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../Features/FlatDetails/data/remote/models/HotelBlocksModel.dart';
import '../Features/SearchFilters/presentation/manager/DatePickerCubit.dart';
import '../Features/SearchForm/domain/entities/Room.dart';
import 'AppTheme/Strings.dart';

String getDiscount(HotelBlocksModel hotelBlocksModel,int blockIndex) {
  if(hotelBlocksModel.block![blockIndex].productPriceBreakdown!.discountedAmount!=null){
    return hotelBlocksModel.block![blockIndex].productPriceBreakdown!.discountedAmount!.value!.toStringAsFixed(2);
  }
  else{
    return "0.00";
  }
}

Future<String> getApiKey() async {
  String apiKey ="";
  await FirebaseFirestore.instance.collection("ApiKey").doc("ApiKey").get().then((value) {
    apiKey = value.data()!['key'];
  });
  return apiKey;
}


Future<bool> getInternetConnectionState() async =>  await InternetConnectionChecker().hasConnection;


String getDateInFormat(DateTime  dateTime){
  return "${dateTime.year}-${dateTime.month}-${dateTime.day}";
}

String getDescription(HotelBlocksModel hotelBlocksModel,int blockIndex){
  return hotelBlocksModel.rooms![getKeyOfRoom(hotelBlocksModel,blockIndex)]!.description!;
}
double getTotalPrice(BuildContext context,HotelBlocksModel hotelBlocksModel,int blockIndex) => (hotelBlocksModel.block![blockIndex!].productPriceBreakdown!.grossAmount!.value!*calcDifferenceBetweenTwoDay(context));

int calcDifferenceBetweenTwoDay(BuildContext context){
  if(context.read<DatePickerCubit>().endData!=null&&context.read<DatePickerCubit>().startData!=null){
    return context.read<DatePickerCubit>().endData!.difference(context.read<DatePickerCubit>().startData!).inDays;
  }
  else{
    return 1;
  }
}

Future<void> handleInternetConnectionStates({required Function onSuccessConnection,required Function onFailureConnection}) async {
  if(await getInternetConnectionState()){
    await onSuccessConnection();
  }
  else{
    await onFailureConnection();
  }
}

String getUrl(HotelBlocksModel hotelBlocksModel,int blockIndex){
  Room currentRoom =hotelBlocksModel.rooms![getKeyOfRoom(hotelBlocksModel,blockIndex)]!;
  if(currentRoom.photos!.isEmpty){
    return defaultImageIfNoImageFound;
  }
  else{
    return currentRoom.photos![0].urlOriginal!;
  }

}
String getKeyOfRoom(HotelBlocksModel hotelBlocksModel,int blockIndex){
  return hotelBlocksModel.block![blockIndex].roomId.toString();
}

Room getRoom(HotelBlocksModel hotelBlocksModel,int blockIndex){
  return hotelBlocksModel.rooms![getKeyOfRoom(hotelBlocksModel,blockIndex)]!;
}