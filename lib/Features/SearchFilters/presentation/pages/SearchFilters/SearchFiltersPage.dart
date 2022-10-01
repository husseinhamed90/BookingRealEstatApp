import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/Core/AppTheme/AppColors.dart';
import 'package:realestate/Core/Constants.dart';
import 'package:realestate/Core/SharedModel/FireMessage.dart';
import 'package:realestate/DependencyInjection.dart';
import 'package:realestate/Features/SearchFilters/presentation/manager/filters_bloc.dart';
import 'package:realestate/Features/SearchFilters/presentation/pages/SearchFilters/SearchFiltersWidgets/SliderORanges.dart';
import 'package:realestate/Features/SearchResults/presentation/pages/SearchResults/SearchResultsPage.dart';
import '../../../../../Core/ReusableComponantes.dart';
import '../../../../Authentication/presentation/pages/SignIn/SignInWidgets/CustomTextField.dart';
import '../../manager/sliders_cubit.dart';

class SearchFiltersPage extends StatelessWidget {
  SearchFiltersPage({Key? key}) : super(key: key);

  int selectedBox = 0;

  List<String> types = ["All", "House", "Flat"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SEARCH FILTERS"),
        centerTitle: true,
      ),
      body: BlocConsumer<FilteringBloc, FilteringState>(
        listener: (context, state) {

          print(state.errorMessage!.message);
          if (state.errorMessage!.message == "Hotels Loaded") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchResults(hotels: state.hotels!),
                ));
          } else if (state.errorMessage!.message == "Required Field Not Found" || state.errorMessage!.message == "Location Field Is Required" ||
              state.errorMessage!.message == "Error When Fetching Hotels" ||
              state.errorMessage!.message == "Error When Fetching Locations") {
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
          if (state.errorMessage!.message == "Loading") {
            return buildDownloadIndicator(context);
          }
          return ListView(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    drawLabelText("COUNTRY AND CITY"),
                    SizedBox(
                      height: 6.h,
                    ),
                    CustomTextField(
                        isSecure: false,
                        isClickable: false,
                        iconName: "Assets/Icons/searchbar.svg",
                        hindText: "Enter Country Name",
                        readOnly: false,
                        haveBorder: true,
                        textAlign: TextAlign.left,
                        controller: dl<FilteringBloc>().locationController,
                        haveIcon: false),
                    // getTextFieldWithLabel(isClickable: false,hintText: "Enter Country Name",label: "COUNTRY AND CITY",textAlign: TextAlign.left,controller: dl<FilteringBloc>().locationController,haveIcon: false,readOnly: false),
                    SizedBox(
                      height: 20.h,
                    ),
                    drawLabelText("Choose Start Date"),
                    SizedBox(
                      height: 6.h,
                    ),
                    CustomTextField(
                        isSecure: false,
                        isClickable: true,
                        iconName: "Assets/Icons/searchbar.svg",
                        hindText: "Choose Start Date",
                        readOnly: true,
                        haveBorder: true,
                        textAlign: TextAlign.left,
                        controller: dl<FilteringBloc>().startDateController,
                        haveIcon: false),
                    SizedBox(
                      height: 20.h,
                    ),
                    drawLabelText("Choose End Date"),
                    SizedBox(
                      height: 6.h,
                    ),
                    CustomTextField(
                        isSecure: false,
                        isClickable: true,
                        iconName: "Assets/Icons/searchbar.svg",
                        hindText: "Choose End Date",
                        readOnly: true,
                        haveBorder: true,
                        textAlign: TextAlign.left,
                        controller: dl<FilteringBloc>().endDateController,
                        haveIcon: false),
                    SizedBox(
                      height: 6.h,
                    ),
                    drawLabelText("PRICE"),
                    BlocBuilder<SlidersCubit,SlidersState>(
                      builder: (context, state) {
                        return SliderOfRanges(
                            values: dl<SlidersCubit>().pricesValues,
                            isSliderRange: true,
                            min: 10,
                            interval: 10,
                            max: 10000,
                            hintText: "€10-10000",
                            controller: dl<SlidersCubit>().priceController);
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    drawLabelText("GUESTS"),
                    BlocBuilder<SlidersCubit,SlidersState>(
                      builder: (context, state) {
                        return  SliderOfRanges(
                            initValue: dl<SlidersCubit>().initAdultsNumber,
                            isSliderRange: false,
                            min: 1,
                            interval: 1,
                            max: 10,
                            hintText: "1-10",
                            controller: dl<SlidersCubit>().guestsController);
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    drawLabelText("ROOMS"),
                    BlocBuilder<SlidersCubit,SlidersState>(
                      builder: (context, state) {
                        return  SliderOfRanges(
                            initValue: dl<SlidersCubit>().initRoomsNumber,
                            varName: "Rooms",
                            isSliderRange: false,
                            min: 1,
                            interval: 1,
                            max: 10,
                            hintText: "1-10",
                            controller: dl<SlidersCubit>().numberOfRoomsController);
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    drawLabelText("HOME TYPE"),
                    SizedBox(
                      height: 6.h,
                    ),
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
                                  color: selectedBox == index
                                      ? primaryColor
                                      : Colors.white,
                                  borderRadius: index == 0
                                      ? const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10))
                                      : index == types.length - 1
                                          ? const BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomRight: Radius.circular(10))
                                          : null),
                              child: Center(
                                child: Text(types[index],
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: selectedBox == index
                                            ? Colors.white
                                            : const Color(0xff9197A2)),
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          );
                        },
                        itemCount: types.length,
                      ),
                    ),
                    SizedBox(
                      height: 87.h,
                    ),
                    SizedBox(
                      height: 60.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Text("SHOW RESULTS"),
                        onPressed: () {
                          dl<FilteringBloc>().add(FetchLocationsEvent(pageNumber: 0));
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
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
