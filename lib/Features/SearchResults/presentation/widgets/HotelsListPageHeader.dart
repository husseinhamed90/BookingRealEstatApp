import 'package:flutter/material.dart';

import '../../../../Core/AppTheme/AppColors.dart';
import '../../../../DependencyInjection.dart';
import '../../../Authentication/presentation/pages/SignIn/SignInWidgets/CustomTextField.dart';
import '../../../SearchFilters/presentation/manager/filters_bloc.dart';

class HotelsListPageHeader extends StatelessWidget{
  const HotelsListPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
          color:primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: CustomTextField(isSecure: false,isClickable: false,controller: dl<FilteringBloc>().locationController ,iconName: "Assets/Icons/searchbar.svg",hindText: dl<FilteringBloc>().locationController.text,readOnly: true,haveBorder: false,textAlign: TextAlign.left),
          )
      ),
    );
  }

}