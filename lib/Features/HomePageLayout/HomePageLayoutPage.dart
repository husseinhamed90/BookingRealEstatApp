import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate/Core/ResuableWidgets/BottomNavBar.dart';
import 'package:realestate/Core/BottomNavBarBloc/bottom_nav_bar_bloc.dart';
import '../../Core/BottomNavBarBloc/bottom_nav_bar_state.dart';
import '../../Core/Constants.dart';

class HomePageLayoutPage extends StatelessWidget {
  const HomePageLayoutPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BottomNavBar(isInHomeScreen: true),
        body: BlocConsumer<BottomNavBarBloc,BottomNavBarState>(
            listenWhen: (previous, current) => previous.navBarIndex!=current.navBarIndex,
            listener: (context, state) {},
            buildWhen: (previous, current) => previous.navBarIndex!=current.navBarIndex,
            builder: (context, state) => pages[state.navBarIndex!]
        )
    );
  }
}
