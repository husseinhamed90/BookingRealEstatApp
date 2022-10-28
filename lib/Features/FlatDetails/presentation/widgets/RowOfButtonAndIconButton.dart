import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/AppTheme/Strings.dart';
import '../../../../DependencyInjection.dart';
import '../../../FavouriteIcon/presentation/widgets/favourite_icon_button.dart';
import '../../../SearchForm/domain/entities/Hotel.dart';
import '../manager/HotelDetailsBloc/HotelDetailsBloc.dart';

class RowOfButtonAndIconButton extends StatelessWidget {
  final Hotel hotel;
  const RowOfButtonAndIconButton({
    required this.hotel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 20.w,
      right: 20.w,
      child: Row(
        children: [
          SizedBox(
            width: 254.w,
            height: 60.h,
            child: ElevatedButton(onPressed: () async{
              dl<HotelDetailsBloc>().add(FetchRoomsEvent(currency: hotel.currencyCode!,hotelId:hotel.hotelId! ));
            }, child: const Text(showRooms)),
          ),
          const Spacer(),
          FavouriteIconButton(hotelModel: hotel),
        ],
      ),
    );
  }
}
