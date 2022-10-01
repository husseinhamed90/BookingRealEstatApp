import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/Core/AppTheme/AppColors.dart';
import 'package:realestate/Features/Authentication/presentation/pages/SignIn/SignInWidgets/CustomTextField.dart';
import 'package:realestate/Features/SearchForm/presentation/manager/HotelsByCoordinatedBloc/hotels_by_coordinates_bloc.dart';
import '../../../../../Core/ResuableWidgets/BuildItem.dart';
import '../../../../../Core/ReusableComponantes.dart';
import '../../../../../DependencyInjection.dart';
import '../../../../FlatDetails/presentation/pages/ItemDetailes.dart';
import '../../../../SearchFilters/presentation/manager/filters_bloc.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelsByCoordinatesBloc,HotelsByCoordinatesState>(
      listener: (context, state) {
         if(state.errorMessage!.message=="Error"||state.errorMessage!.message=="Error When Fetching Hotels Details"){
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
      buildWhen: (previous, current) {
        return current.errorMessage!.message=="Hotels Loaded"||current.errorMessage!.message=="Loading"||current.errorMessage!.message=="Initial"||current.errorMessage!.message=="Hotel Details Loaded";
      },
      listenWhen: (previous, current) {
        return current.errorMessage!.message!="Initial";
      },
      builder: (context, state) {
        if(state.errorMessage!.message=="Hotels Loaded"||state.errorMessage!.message=="Hotel Details Loaded"||state.errorMessage!.message=="Initial"){
          return ListView(
            children: [
              Container(
                  color: primaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child:  Text("SEARCH",style: Theme.of(context).appBarTheme.titleTextStyle),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: getColumn(firstString: "Book homes and flats",secondString: "In 63 countries from €49 per night"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: CustomTextField(isClickable: true,controller: dl<FilteringBloc>().locationController,iconName: "Assets/Icons/searchbar.svg",hindText: "Where do you want to go?",readOnly: true,haveBorder: false,textAlign: TextAlign.left),
                      ),
                    ],
                  )
              ),
              SizedBox(height: 14.h,),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Text("NEAREST",style: TextStyle(
                      letterSpacing: 5,
                      fontSize: 50.sp,fontWeight: FontWeight.w800,color: const Color(0xff9197A2).withOpacity(0.1)
                  ),),
                  Positioned(
                    bottom: 16.h,
                    child: Text("NEAREST HOTEL",style: TextStyle(
                        letterSpacing: 1.4,
                        fontSize: 14.sp,fontWeight: FontWeight.w800,color: const Color(0xff312D2C)
                    ),),
                  )
                ],
              ),
              SizedBox(
                height: 400.h,
                child: ListView.builder(
                  itemCount: state.hotels!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  ItemDetails(hotelModel: state.hotels![index]),));
                        },
                        child: BuildItem(bottomPaddingValue: 0,hotelModel: state.hotels![index],width: 295.w,));
                  },),
              )
            ],
          );
        }
        else{
          return buildDownloadIndicator(context);
        }
      },
    );
  }
}
