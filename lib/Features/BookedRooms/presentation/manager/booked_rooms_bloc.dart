import 'package:bloc/bloc.dart';
import 'package:realestate/Core/EventCommand.dart';
import '../../../../Core/AppTheme/Strings.dart';
import '../../../../Core/Utils.dart';
import '../../../../DependencyInjection.dart';
import '../../../FlatDetails/domain/entities/HotelRooms.dart';
import '../../data/repositories/FirebaseBookedHotelsRepository.dart';
import 'booked_rooms_event.dart';
import 'booked_rooms_state.dart';


class BookedRoomsBloc extends Bloc<BookedRoomsEvent, BookedRoomsState> implements EventCommand {

  BookedRoomsEvent ? lastExecutedEvent;

  void setLastExecutedEvent(BookedRoomsEvent filteringEvent){
    lastExecutedEvent = filteringEvent;
  }

  BookedRoomsBloc() : super(const BookedRoomsState(message: loading)) {
    on<GetBookedHotels>((event, emit) async{
      setLastExecutedEvent(event);
      if(await getInternetConnectionState()){
        emit(state.copyWith(message: loading));
        List<Block> blocks= await dl.get<FirebaseBookedHotelsRepository>().getBookedHotels();
        emit(state.copyWith(message: "",blocksList: blocks));
      }
      else{
        emit(state.copyWith(message: "No Internet"));
      }
    });

    on<BookHotel>((event, emit) async{
      setLastExecutedEvent(event);
      if(await getInternetConnectionState()){
        emit(state.copyWith(message: loading));
        await dl.get<FirebaseBookedHotelsRepository>().bookHotel(event.block!);
        emit(state.copyWith(message: ""));
      }
      else{
        emit(state.copyWith(message: "No Internet"));
      }
    });
  }

  @override
  void executeCommand() {
    add(lastExecutedEvent!);
  }
}