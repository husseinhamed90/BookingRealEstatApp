import 'dart:ui';

import 'package:equatable/equatable.dart';

import '../../../FlatDetails/domain/entities/HotelRooms.dart';

class BookedRoomsState extends Equatable {
  final List<Block>?blocksList;
  final String? message;
  const BookedRoomsState({this.blocksList,this.message});

  BookedRoomsState copyWith({
    List<Block>?blocksList,
    String? message,
    Color?color
  }) {
    return BookedRoomsState(
        blocksList :blocksList??this.blocksList,
        message: message??this.message);
  }
  @override
  List<Object?> get props => [blocksList,identityHashCode(this),message];
}
