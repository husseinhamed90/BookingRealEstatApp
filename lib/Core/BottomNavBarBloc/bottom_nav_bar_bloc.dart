import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'bottom_nav_bar_state.dart';

part 'bottom_nav_bar_event.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  BottomNavBarBloc() : super(const BottomNavBarState().copyWith(navBarIndex: 0)) {
    on<ChangeNavBarIndexEvent>((event, emit) {
      emit(state.copyWith(navBarIndex: event.newIndex));
    });
  }
}
