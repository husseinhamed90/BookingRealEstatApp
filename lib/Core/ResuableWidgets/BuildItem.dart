import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:realestate/Features/SearchForm/domain/entities/Hotel.dart';
import '../../Features/Favourites/presentation/widgets/favourite_icon_button.dart';
import '../../Features/FlatDetails/presentation/pages/ItemDetailes.dart';
import '../AppTheme/AppColors.dart';
import '../AppTheme/Strings.dart';

class BuildItem extends StatelessWidget {
  final int bottomPaddingValue;
  final Hotel hotelModel;
  final double ?width;
  BuildItem({
    Key? key,required this.bottomPaddingValue,required this.hotelModel ,this.width
  }) : super(key: key);

  late Box userBox;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  ItemDetails(hotelModel: hotelModel),));
      },
      child: Padding(
        padding:  EdgeInsets.only(bottom: bottomPaddingValue.h),
        child: Card(
          child: Stack(
            children: [
              SizedBox(
                height: 400.h,
                width: width??width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl: hotelModel.maxPhotoUrl==null?defaultImageIfNoImageFound:hotelModel.maxPhotoUrl!,
                      imageBuilder: (context, imageProvider) => Container(
                          height: 200.h,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          )
                      ),
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: primaryColor)),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                    SizedBox(height: 21.h,),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(hotelModel.hotelName!,style: TextStyle(
                              color: const Color(0xff312D2C),fontSize: 22.sp,fontWeight: FontWeight.w800,height: 35.h/22
                          ),overflow: TextOverflow.ellipsis,maxLines: 2,),
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
                                    Text(priceLabel,style: TextStyle(
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
                                    Text(guestsMaxLabel,style: TextStyle(
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
              FavouriteIconButton(hotelModel: hotelModel)
            ],
          ),
        )
      ),
    );
  }
}
