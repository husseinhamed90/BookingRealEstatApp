import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:realestate/Features/FlatDetails/domain/entities/HotelRooms.dart';
import '../../../../Core/AppTheme/Strings.dart';

class ZoomIconButton extends StatelessWidget {
  const ZoomIconButton({Key ?key,required this.block}) : super(key: key);
  final Block block;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,top: 20,
      child: GestureDetector(
        onTap: () async{
          await alertDialog(context,block);
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
    );
  }

  Future alertDialog(BuildContext context,Block block)async{
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
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
                        child: AutoSizeText(overflow: TextOverflow.ellipsis,maxLines: 2,block.roomName!,style: TextStyle(
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
                      itemCount: block.blockRoom!.photos!.length,
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
                                      image: NetworkImage(block.blockRoom!.photos![index].urlOriginal!)
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
}
