import 'package:equatable/equatable.dart';

class BottomNavBarState extends Equatable {
  final int ?navBarIndex;
  const BottomNavBarState({this.navBarIndex});
  BottomNavBarState copyWith({
    int ?navBarIndex,
  }) {
    return BottomNavBarState(
        navBarIndex: navBarIndex ?? this.navBarIndex,
    );
  }
  @override
  List<Object?> get props =>[navBarIndex];
}