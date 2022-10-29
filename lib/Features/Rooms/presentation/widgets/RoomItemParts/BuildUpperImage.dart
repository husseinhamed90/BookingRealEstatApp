import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/Core/AppTheme/AppColors.dart';
import '../../../../../Core/Utils.dart';
import '../../../../FlatDetails/domain/entities/HotelRooms.dart';

class BuildUpperImage extends StatelessWidget {
  const BuildUpperImage({
    Key? key,
    required this.block,
  }) : super(key: key);

  final Block block;

  @override
  Widget build(BuildContext context) {

    return CachedNetworkImage(
      imageUrl: getUrl(block.blockRoom!),
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
      placeholder: (context, url) => const CircularProgressIndicator(color: primaryColor),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}