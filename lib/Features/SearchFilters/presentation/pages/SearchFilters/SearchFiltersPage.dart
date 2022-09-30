
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/Core/AppColors.dart';
import 'package:realestate/Core/Constants.dart';
import 'package:realestate/Core/FireMessage.dart';
import 'package:realestate/DependencyInjection.dart';
import 'package:realestate/Features/SearchFilters/presentation/manager/filters_bloc.dart';
import 'package:realestate/Features/SearchFilters/presentation/pages/SearchFilters/SearchFiltersWidgets/SliderORanges.dart';
import 'package:realestate/Features/SearchResults/presentation/pages/SearchResults/SearchResultsPage.dart';
import '../../../../../Core/ReusableComponantes.dart';

class SearchFiltersPage extends StatelessWidget {

   SearchFiltersPage({Key? key}) : super(key: key);

  int selectedBox =0;


  List<String>types=["All","House","Flat"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SEARCH FILTERS"),
        centerTitle: true,
      ),
      body: BlocConsumer<FilteringBloc,FilteringState>(
        listener: (context, state) {
          if(state.errorMessage!.message=="Hotels Loaded"){
             Navigator.push(context, MaterialPageRoute(builder: (context) => SearchResults(hotels: state.hotels!),));
          }
          else if(state.errorMessage!.message=="Required Field Not Found"|| state.errorMessage!.message=="Location Field Is Required"|| state.errorMessage!.message=="Error When Fetching Hotels"||state.errorMessage!.message=="Error When Fetching Locations"){
            final snackBar = SnackBar(
              content: Text(state.errorMessage!.message),
              action: SnackBarAction(
                label: 'Undo',
                onPressed: () {
                  // Some code to undo the change.
                },
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          if(state.errorMessage!.message=="Loading"){
            return buildDownloadIndicator(context);
          }
          return ListView(
          children: [
            SizedBox(height: 30.h,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getTextFieldWithLabel(isClickable: false,hintText: "Enter Country Name",label: "COUNTRY AND CITY",textAlign: TextAlign.left,controller: dl<FilteringBloc>().locationController,haveIcon: false,readOnly: false),
                  SizedBox(height: 20.h,),
                  getTextFieldWithLabel(isClickable: false,hintText: "Enter Date",label: "DATE",textAlign: TextAlign.left,haveIcon: false,readOnly: true),
                  SizedBox(height: 20.h,),
                  drawLabelText("PRICE"),
                  SliderOfRanges(min: 10,interval: 10,max: 400,hintText: "€40-250",values: priceValues,controller:  dl<FilteringBloc>().priceController),
                  SizedBox(height: 20.h,),
                  drawLabelText("GUESTS"),
                  SliderOfRanges(min: 1,interval: 1,max: 10,hintText: "1-4",values: guestsValues,controller:  dl<FilteringBloc>().guestsController),
                  SizedBox(height: 20.h,),
                  drawLabelText("HOME TYPE"),
                  SizedBox(height: 6.h,),
                  SizedBox(
                    height: 41.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // setState(() {
                            //   selectedBox=index;
                            // });
                          },
                          child: Container(
                            height: 41.h,
                            width: 112.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.5.w,
                                  color: const Color(0xffF2F2F2),
                                ),
                                color: selectedBox==index?primaryColor:Colors.white,
                                borderRadius: index==0?const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)):
                                index==types.length-1? const BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)):null
                            ),
                            child: Center(
                              child: Text(types[index],style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,color: selectedBox==index?Colors.white:const Color(0xff9197A2)
                              ),textAlign: TextAlign.center),
                            ),
                          ),
                        );
                      },
                      itemCount: types.length,
                    ),
                  ),
                  SizedBox(height: 87.h,),
                  SizedBox(
                    height: 60.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text("SHOW RESULTS"),
                      onPressed: () {
                        // if(dl<FilteringBloc>().locationController.text==""){
                        //   dl<FilteringBloc>().add(FireErrorMessageEvent(errorMessage: FireMessage("Location Field Is Required")));
                        // }
                        // else if(state.errorMessage!.message=="Locations Loaded"){
                        //   dl<FilteringBloc>().add(FetchLocationsEvent(locationString: dl<FilteringBloc>().locationController.text));
                        //   // if(state.locations!=[]){
                        //   //   dl<FilteringBloc>().add(StartFilterDataEvent(locationModel: state.locations![0]));
                        //   // }
                        // }
                        dl<FilteringBloc>().add(FetchLocationsEvent());
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        );
        },
      ),
    );
  }

}