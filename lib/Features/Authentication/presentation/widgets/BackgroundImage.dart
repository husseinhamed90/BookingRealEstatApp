import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Core/AppTheme/Strings.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SvgPicture.asset(
        backgroundImageAsset,
        fit: BoxFit.fill,
      ),
    );
  }
}