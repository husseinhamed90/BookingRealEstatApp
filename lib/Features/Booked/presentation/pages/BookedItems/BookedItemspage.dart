import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelBlocksModel.dart';
import '../../../../../Core/AppColors.dart';
import '../../../../../Core/ReusableComponantes.dart';

class BookedItemsPage extends StatelessWidget {
   const BookedItemsPage({Key? key,required this.hotelBlockModel}) : super(key: key);
   final List<HotelBlocksModel>hotelBlockModel;
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BOOKED"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: getColumn(firstString: "Your booked items",secondString: "You booked 8 flats and 3 homes"),
                  ),
                  SizedBox(height: 20.h,),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20.h,),
          ),
          SliverPadding(
            padding: EdgeInsets.only(right: 20.w,left: 20.w),
            sliver: SliverList(delegate: SliverChildBuilderDelegate((context, index) {
             // return const BuildItem(bottomPaddingValue: 20,);
              print(hotelBlockModel[0].hotelId);
              return Container(child: Column(
                children: [
                  Text(hotelBlockModel[0].block![index].roomName!),
                  Text(hotelBlockModel[0].block![index].productPriceBreakdown!.grossAmount!.value!.toStringAsFixed(2)),

                  Text(hotelBlockModel[0].rooms![hotelBlockModel[0].block![index].roomId.toString()]!.description!),
                  Container(
                    height: 200.h,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(hotelBlockModel[0].rooms![hotelBlockModel[0].block![index].roomId.toString()]!.photos![1].urlOriginal!)
                        )
                    ),
                  ),
                ],
              ));
            },childCount: hotelBlockModel[0].block!.length)),
          )
        ],
      ),

    );
  }
}
