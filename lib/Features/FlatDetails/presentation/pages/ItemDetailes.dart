
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/Core/AppTheme/Strings.dart';
import 'package:realestate/Features/FavouriteIcon/presentation/widgets/favourite_icon_button.dart';
import 'package:realestate/Features/FlatDetails/data/remote/models/DescriptionModel.dart';
import 'package:realestate/Features/FlatDetails/data/remote/models/HotelPhotoModel.dart';
import 'package:realestate/Features/FlatDetails/presentation/manager/HotelDetailsBloc/HotelDetailsBloc.dart';
import 'package:realestate/Features/Rooms/presentation/pages/HotelRooms/HotelRoomsPage.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelModel.dart';
import '../../../../Core/AppTheme/AppColors.dart';
import '../../../../Core/ResuableWidgets/NoConnectionImage.dart';
import '../../../../Core/ReusableComponantes.dart';
import '../../../../DependencyInjection.dart';
import '../../../FavouriteIcon/presentation/manager/FavouriteIconCubit/favourite_cubit.dart';
import '../../../SearchForm/domain/entities/Hotel.dart';
import '../../data/remote/models/HotelDetailsModel.dart';
import '../manager/HotelDetailsBloc/HotelDetailsState.dart';
import '../widgets/HotelDetailsBody.dart';


class ItemDetails extends StatefulWidget {
  final Hotel hotelModel;
  const ItemDetails({Key? key,required this.hotelModel}) : super(key: key);

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {

  @override
  void initState() {
    super.initState();
    dl<HotelDetailsBloc>().add(FetchHotelDetailsEvent(hotelModel: widget.hotelModel));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<HotelDetailsBloc,HotelDetailsState>(
          builder: (context, state) {
            if(state.message!.message==loading){
              return buildDownloadIndicator(context);
            }
            else if(state.errorMessage!=null||state.hotelDetailsModel==null||state.hotelDescriptionModel==null||state.hotelPhotoModel==null){
              return NoConnectionImage(eventCommand: dl.get<HotelDetailsBloc>());
            }
            else{
               return HotelDetailsBody(hotelDescriptionModel: state.hotelDescriptionModel!, hotelDetailsModel: state.hotelDetailsModel!, hotelPhotoModels: state.hotelPhotoModel!, hotel: state.hotelModel!);
            }
          },
          listener: (context, state) {
            if(state.message!.message=="Hotel Rooms Loaded"){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HotelRoomsPage(hotelBlockModel: state.hotelBlockModel!),));
            }
            else if(state.errorMessage!=null){
              final snackBar = SnackBar(
                content: Text(state.errorMessage!.message),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {},
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ));
  }

}
