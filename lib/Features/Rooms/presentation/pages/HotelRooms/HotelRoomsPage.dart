import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/Features/Rooms/presentation/pages/HotelRooms/room_item.dart';
import '../../../../../Core/AppTheme/AppColors.dart';
import '../../../../../Core/ReusableComponantes.dart';
import '../../../../FlatDetails/data/remote/models/HotelBlocksModel.dart';

class HotelRoomsPage extends StatelessWidget {
   const HotelRoomsPage({Key? key,required this.hotelBlockModel}) : super(key: key);
   final List<HotelBlocksModel>hotelBlockModel;
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ROOMS"),
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
                    child: getColumn(firstString: "Hotel Rooms",secondString: "We Have ${hotelBlockModel[0].rooms!.length.toString()} Types Of Rooms And ${hotelBlockModel[0].block!.length.toString()} Available Block"),
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
              return RoomItem(hotelBlocksModel: hotelBlockModel[0], blockIndex: index);
            },childCount: hotelBlockModel[0].block!.length)),
          )
        ],
      )
    );
  }

}
