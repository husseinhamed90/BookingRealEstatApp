import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Core/AppTheme/Strings.dart';
import '../../../../FlatDetails/data/remote/models/HotelBlocksModel.dart';
import '../../widgets/RoomsList.dart';
import '../../widgets/UpperSection.dart';

class HotelRoomsPage extends StatelessWidget {
   const HotelRoomsPage({Key? key,required this.hotelBlockModel}) : super(key: key);
   final List<HotelBlocksModel>hotelBlockModel;
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text(hotelRoomsAppbarTitle),
      ),
      body: CustomScrollView(
        slivers: [
          UpperSection(hotelBlockModel: hotelBlockModel),
          SliverToBoxAdapter(
            child: SizedBox(height: 20.h,),
          ),
          RoomsList(blocks: hotelBlockModel[0].blocks!,isBookedRooms: false,)
        ],
      )
    );
  }
}


