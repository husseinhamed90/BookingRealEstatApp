import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/Core/Utils.dart';
import 'package:realestate/Features/FlatDetails/domain/entities/HotelRooms.dart';

import '../../../../Core/AppTheme/Strings.dart';
import '../../../FlatDetails/data/remote/models/HotelBlocksModel.dart';
import 'PaymentTap.dart';

class BookNowButton extends StatelessWidget {
  const BookNowButton({
    Key? key,
    required this.block,
  }) : super(key: key);

  final Block block;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110.w,
      height: 50.h,
      child: ElevatedButton(onPressed: ()async{
        if(await getInternetConnectionState()){
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (BuildContext context) => PaymentTap(block: block,)
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