import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/Core/AppTheme/AppColors.dart';
import 'package:realestate/Core/AppTheme/Strings.dart';
import 'package:realestate/Core/ResuableWidgets/NoConnectionImage.dart';
import 'package:realestate/DependencyInjection.dart';
import 'package:realestate/Features/BookedRooms/data/repositories/FirebaseBookedHotelsRepository.dart';
import 'package:realestate/Features/BookedRooms/presentation/manager/booked_rooms_bloc.dart';
import 'package:realestate/Features/FlatDetails/data/remote/models/HotelBlocksModel.dart';
import 'package:realestate/Features/FlatDetails/domain/entities/HotelRooms.dart';

import '../../../Rooms/presentation/widgets/RoomsList.dart';
import '../manager/booked_rooms_event.dart';
import '../manager/booked_rooms_state.dart';

class BookedRooms extends StatefulWidget {
  final List<Block> blocks;
  const BookedRooms({Key ?key,required this.blocks}) : super(key: key);

  @override
  State<BookedRooms> createState() => _BookedRoomsState();
}

class _BookedRoomsState extends State<BookedRooms> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dl.get<BookedRoomsBloc>().add(GetBookedHotels());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  const Text("BOOKED ROOMS"),
        ),
        body:  BlocConsumer<BookedRoomsBloc,BookedRoomsState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            if(state.message==loading){
              return const Center(child: CircularProgressIndicator(color: primaryColor,));
            }
            else if(state.message=="No Internet"){
              return NoConnectionImage(eventCommand: dl.get<BookedRoomsBloc>());
            }
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(height: 20.h,),
                ),
                RoomsList(blocks: state.blocksList!,)
              ],
            );
          },
        )
    );
  }
}
