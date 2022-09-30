part of 'bottom_nav_bar_bloc.dart';

abstract class BottomNavBarEvent extends Equatable {
  const BottomNavBarEvent();
}
class ChangeNavBarIndexEvent extends BottomNavBarEvent {
  final int newIndex;

  const ChangeNavBarIndexEvent({required this.newIndex});

  @override
  List<Object?> get props => [newIndex];

}