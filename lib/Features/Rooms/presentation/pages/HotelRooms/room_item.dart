import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tap_payment/flutter_tap_payment.dart';
import 'package:get/get.dart';
import 'package:realestate/DependencyInjection.dart';
import 'package:realestate/Features/Authentication/presentation/manager/auth_bloc.dart';
import 'package:realestate/Features/FavouriteIcon/presentation/manager/FavouriteIconCubit/favourite_cubit.dart';
import 'package:realestate/Features/FlatDetails/data/remote/models/HotelBlocksModel.dart';
import 'package:realestate/Features/SearchForm/domain/entities/Room.dart';
import 'package:realestate/PaymentDone.dart';
import 'package:get_it/get_it.dart';

import '../../../../../Core/AppTheme/Strings.dart';

class RoomItem extends StatelessWidget {
  const RoomItem({Key? key,required this.hotelBlocksModel,required this.blockIndex}) : super(key: key);
  final int ?blockIndex;
  final HotelBlocksModel hotelBlocksModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 200.h,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(getUrl(hotelBlocksModel))
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.h,),
                  Text(hotelBlocksModel.block![blockIndex!].roomName!,style: TextStyle(
                      color: const Color(0xff312D2C),fontSize: 20.sp,fontWeight: FontWeight.w800,height: 35.h/22
                  ),),
                  Text(getDescription(hotelBlocksModel),style: TextStyle(
                      color: const Color(0xff9197A2),fontSize: 14.sp,fontWeight: FontWeight.w800,height: 35.h/22
                  ),),
                //  SizedBox(height: 16.h,),
                  Row(
                    children: [
                      Expanded(
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText("\$ ${hotelBlocksModel.block![blockIndex!].productPriceBreakdown!.grossAmount!.value!.toStringAsFixed(2)}",style: TextStyle(
                                color: const Color(0xff312D2C),fontSize: 24.sp,fontWeight: FontWeight.w700
                            ),maxLines: 1),
                            AutoSizeText(perNight,style: TextStyle(
                                color: const Color(0xff9197A2),fontSize: 14.sp,fontWeight: FontWeight.w400, height: 1.2.h
                            ),maxLines: 1),
                          ],
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      Container(height: 55.h,color: const Color(0xff9197A2),width: 1),
                      SizedBox(width: 10.w,),
                      Expanded(
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText("${hotelBlocksModel.block![blockIndex!].nrAdults}",style: TextStyle(
                                color: const Color(0xff312D2C),fontSize: 24.sp,fontWeight: FontWeight.w700
                            ),maxLines: 1),
                            AutoSizeText(adultsLabel,style: TextStyle(
                                color: const Color(0xff9197A2),fontSize: 14.sp,fontWeight: FontWeight.w400, height: 1.2.h,
                            ),maxLines: 1),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 110.w,
                        height: 50.h,
                        child: ElevatedButton(onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => buildTapPayment()
                            ),
                          );

                        }, style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide.none)),
                        ), child: const Text(bookNow)),
                      ),
                      SizedBox(width: 15.w,),
                    ],
                  ),
                  SizedBox(height: 15.h,),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          right: 20,top: 20,

          child: GestureDetector(
            onTap: () async{
              await alertDialog(context);
            },
            child: SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                zoomIconAsset,color: Colors.white,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }

  TapPayment buildTapPayment() {
    return TapPayment(
        apiKey: "sk_test_XKokBfNWv6FIYuTMg5sLPjhJ",
        redirectUrl: "www.facebook.com",
        postUrl: "www.facebook.com",
        paymentData: {
          "amount": hotelBlocksModel.block![blockIndex!].productPriceBreakdown!.grossAmount!.value!.toStringAsFixed(2),
          "currency": hotelBlocksModel.block![blockIndex!].productPriceBreakdown!.grossAmount!.currency,
          "threeDSecure": true,
          "save_card": false,
          "description": "Test Description",
          "statement_descriptor": "Sample",
          "metadata": {"udf1": "test 1", "udf2": "test 2"},
          "reference": {
            "transaction": "txn_0001",
            "order": "ord_0001"
          },
          "receipt": {"email": false, "sms": true},
          "customer": {
            "first_name": dl.get<AuthBloc>().userEntity!.userName,
            "middle_name": "",
            "last_name": "",
            "email": dl.get<AuthBloc>().userEntity!.email,
            "phone": {
              "country_code": "965",
              "number": dl.get<AuthBloc>().userEntity!.phoneNumber
            }
            },
          "source": {"id": "src_card"},
        },
        onSuccess: (Map data)async{
          await dl.get<NavigationService>().navigateTo('/PaymentDone');
          },
        onError: (error) {
        });
  }

  Future alertDialog(BuildContext context)async{
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(

          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          content: SizedBox(
            height: 435.h,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(onTap: () {
                        Navigator.pop(context);
                      },child: const Icon(Icons.cancel)),
                      SizedBox(width: 10.w,),
                      Expanded(
                        child: AutoSizeText(overflow: TextOverflow.ellipsis,maxLines: 2,hotelBlocksModel.block![blockIndex!].roomName!,style: TextStyle(
                            color: const Color(0xff312D2C),fontSize: 20.sp,fontWeight: FontWeight.w800
                        ),),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
                SizedBox(
                  height: 375.h,
                  child: PageView.builder(
                      itemCount: getRoom(hotelBlocksModel).photos!.length,
                      pageSnapping: true,
                      itemBuilder: (context,index){
                        return  Column(
                          children: [
                            Container(
                              height: 375.h,
                              decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(getRoom(hotelBlocksModel).photos![index].urlOriginal!)
                                  )
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String getUrl(HotelBlocksModel hotelBlocksModel){
    Room currentRoom =hotelBlocksModel.rooms![getKeyOfRoom(hotelBlocksModel)]!;
    if(currentRoom.photos!.isEmpty){
      return defaultImageIfNoImageFound;
    }
    else{
      return currentRoom.photos![0].urlOriginal!;
    }

  }

  Room getRoom(HotelBlocksModel hotelBlocksModel){
    return hotelBlocksModel.rooms![getKeyOfRoom(hotelBlocksModel)]!;
  }

  String getDescription(HotelBlocksModel hotelBlocksModel){
    return hotelBlocksModel.rooms![getKeyOfRoom(hotelBlocksModel)]!.description!;
  }

  String getKeyOfRoom(HotelBlocksModel hotelBlocksModel){
    return hotelBlocksModel.block![blockIndex!].roomId.toString();
  }
}

class PaymentPage extends StatefulWidget {

  const PaymentPage({
    Key? key,
    required this.hotelBlocksModel,
    required this.blockIndex,
  }) : super(key: key);

  final HotelBlocksModel hotelBlocksModel;
  final int? blockIndex;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteCubit,FavouriteState>(
      builder: (context, state) {
        return TapPayment(
            apiKey: "sk_test_XKokBfNWv6FIYuTMg5sLPjhJ",
            redirectUrl: "www.facebook.com",
            postUrl: "www.facebook.com",
            paymentData: {
              "amount": widget.hotelBlocksModel.block![widget.blockIndex!].productPriceBreakdown!.grossAmount!.value!.toStringAsFixed(2),
              "currency": widget.hotelBlocksModel.block![widget.blockIndex!].productPriceBreakdown!.grossAmount!.currency,
              "threeDSecure": true,
              "save_card": false,
              "description": "Test Description",
              "statement_descriptor": "Sample",
              "metadata": {"udf1": "test 1", "udf2": "test 2"},
              "reference": {
                "transaction": "txn_0001",
                "order": "ord_0001"
              },
              "receipt": {"email": false, "sms": true},
              "customer": {
                "first_name": dl.get<AuthBloc>().userEntity!.userName,
                "middle_name": "",
                "last_name": "",
                "email": dl.get<AuthBloc>().userEntity!.email,
                "phone": {
                  "country_code": "965",
                  "number": dl.get<AuthBloc>().userEntity!.phoneNumber
                }
              },
              "source": {"id": "src_card"},
            },
            onSuccess: (Map data)async{
               print(data);
               await dl.get<NavigationService>().navigateTo('/PaymentDone');

            },
            onError: (error) {

            });
      },
      listener: (context, state) {
        if(state.message=="PaymentDone"){

         // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PaymentProcessEnd(),));
        }
      },
    );
  }
}
