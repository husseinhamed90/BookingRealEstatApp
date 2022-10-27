import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/Core/Utils.dart';

import '../../../../Core/AppTheme/Strings.dart';
import '../../../FlatDetails/data/remote/models/HotelBlocksModel.dart';
import 'PaymentTap.dart';

class BookNowButton extends StatelessWidget {
  const BookNowButton({
    Key? key,
    required this.hotelBlocksModel,
    required this.blockIndex,
  }) : super(key: key);

  final HotelBlocksModel hotelBlocksModel;
  final int? blockIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110.w,
      height: 50.h,
      child: ElevatedButton(onPressed: ()async{
        if(await getInternetConnectionState()){
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (BuildContext context) => PaymentTap(hotelBlocksModel: hotelBlocksModel, blockIndex: blockIndex)
            ),
          );
        }
        else{
          final snackBar = SnackBar(
            content: const Text("No Internet Connection"),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }, style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide.none)),
      ), child: const Text(bookNow)),
    );
  }
}