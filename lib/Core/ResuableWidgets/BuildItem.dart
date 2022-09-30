import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelModel.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../Features/FlatDetails/presentation/manager/favourite_cubit.dart';
import '../../Features/FlatDetails/presentation/pages/ItemDetailes.dart';

class BuildItem extends StatelessWidget {
  final int bottomPaddingValue;
  final HotelModel hotelModel;
  final double ?width;
   const BuildItem({
    Key? key,required this.bottomPaddingValue,required this.hotelModel ,this.width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  ItemDetails(hotelModel: hotelModel),));
      },
      child: Padding(
        padding:  EdgeInsets.only(bottom: bottomPaddingValue.h),
        child: BlocBuilder<FavouriteCubit,FavouriteState>(
          builder: (context, state) {
            return Card(
              child: Stack(
                children: [
                  SizedBox(
                    height: 400.h,
                    width: width??width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200.h,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(hotelModel.maxPhotoUrl==null?"https://q-xx.bstatic.com/xdata/images/hotel/840x460/166841139.jpg?k=30c83e588229e98701cb12f5e265f8dcf788d2339cca4b3fb5930fe988a786cd&o=":hotelModel.maxPhotoUrl!)
                              )
                          ),
                        ),
                        SizedBox(height: 21.h,),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(hotelModel.hotelName!,style: TextStyle(
                                  color: const Color(0xff312D2C),fontSize: 22.sp,fontWeight: FontWeight.w800,height: 35.h/22
                              ),),
                              SizedBox(height: 10.h,),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText("\$ ${hotelModel.minTotalPrice!.toStringAsFixed(2)}",style: TextStyle(
                                            color: const Color(0xff312D2C),fontSize: 22.sp,fontWeight: FontWeight.w700
                                        ),),
                                        Text("Price",style: TextStyle(
                                            color: const Color(0xff9197A2),fontSize: 13.sp,fontWeight: FontWeight.w400, height: 1.2.h
                                        ),),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 79.w,),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("2",style: TextStyle(
                                          color: const Color(0xff312D2C),fontSize: 22.sp,fontWeight: FontWeight.w700,
                                        ),),
                                        Text("guests max",style: TextStyle(
                                            color: const Color(0xff9197A2),fontSize: 13.sp,fontWeight: FontWeight.w400, height: 1.2.h
                                        ),),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: 15.w,
                    top: 15.w,
                    child: GestureDetector(
                      onTap: () {
                        context.read<FavouriteCubit>().updateList(hotelModel);
                      },
                      child: Card(
                        elevation: 0.5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child:  Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            height: 40.h,width: 40.h,
                            child: Padding(
                              padding:  EdgeInsets.all(12.h),
                              child: SvgPicture.asset("Assets/Icons/heart_fill.svg",color: context.read<FavouriteCubit>().changeColor(hotelModel)),
                            )
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
