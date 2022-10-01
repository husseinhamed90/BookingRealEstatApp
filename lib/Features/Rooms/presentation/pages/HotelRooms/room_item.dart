import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:realestate/Features/FlatDetails/data/remote/models/HotelBlocksModel.dart';
import 'package:realestate/Features/SearchForm/domain/entities/Room.dart';

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
                            AutoSizeText("Per Night",style: TextStyle(
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
                            AutoSizeText("Adults",style: TextStyle(
                                color: const Color(0xff9197A2),fontSize: 14.sp,fontWeight: FontWeight.w400, height: 1.2.h,
                            ),maxLines: 1),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 110.w,
                        height: 50.h,
                        child: ElevatedButton(onPressed: (){
                          
                        }, style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide.none)),
                        ), child: const Text("BOOK NOW")),
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
                "Assets/Icons/zoom.svg",color: Colors.white,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
  Future alertDialog(BuildContext context)async{
    return await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(hotelBlocksModel.block![blockIndex!].roomName!,style: TextStyle(
              color: const Color(0xff312D2C),fontSize: 20.sp,fontWeight: FontWeight.w800,height: 35.h/22
          ),),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          content: SizedBox(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
                itemCount: getRoom(hotelBlocksModel).photos!.length,
                pageSnapping: true,
                itemBuilder: (context,index){
                  return  Container(
                    height: 375.h,
                    decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(getRoom(hotelBlocksModel).photos![index].urlOriginal!)
                        )
                    ),
                  );
                }),
          ),
        );
      },
    );
  }
  String getUrl(HotelBlocksModel hotelBlocksModel){
    Room x =hotelBlocksModel.rooms![getKeyOfRoom(hotelBlocksModel)]!;
    if(x.photos!.isEmpty){
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png";
    }
    else{
      return x.photos![0].urlOriginal!;
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
