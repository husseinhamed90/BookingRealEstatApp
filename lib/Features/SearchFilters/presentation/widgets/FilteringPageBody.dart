import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'FiltersFields.dart';

class FilteringPageBody extends StatelessWidget {
  const FilteringPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 30.h,
        ),
        const FiltersFields()
      ],
    );
  }
}

