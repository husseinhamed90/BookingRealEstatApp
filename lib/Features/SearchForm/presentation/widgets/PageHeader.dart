import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/AppTheme/AppColors.dart';
import '../../../../Core/ReusableComponantes.dart';
import '../../../../DependencyInjection.dart';
import '../../../Authentication/presentation/pages/SignIn/SignInWidgets/CustomTextField.dart';
import '../../../SearchFilters/presentation/manager/filters_bloc.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child:  Text("SEARCH",style: Theme.of(context).appBarTheme.titleTextStyle),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: getColumn(firstString: "Book homes and flats",secondString: "In All countries from \$ 10 per night"),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: CustomTextField(isSecure: false,isClickable: true,controller: dl<FilteringBloc>().locationController,iconName: "Assets/Icons/searchbar.svg",hindText: "Where do you want to go?",readOnly: true,haveBorder: false,textAlign: TextAlign.left),
            ),
          ],
        )
    );
  }
}