
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/Core/AppTheme/Strings.dart';
import 'package:realestate/Features/FavouriteIcon/presentation/widgets/favourite_icon_button.dart';
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
import '../manager/HotelDetailsBloc/HotelDetailsState.dart';


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
               return ListView(
                children: [
                  buildImageSlider(state, context),
                  SizedBox(height: 30.h,),
                  buildItemInfo(color: primaryColor,hotelDetailsModel: state.hotelDetailsModel!,hotelModel: widget.hotelModel),
                  SizedBox(height: 14.h,),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(state.hotelDescriptionModel!.description.toString(),style: TextStyle(
                      color: const Color(0xff9197A2),fontSize: 16.sp,fontWeight: FontWeight.w400,height: 27.h/16,
                    ),),
                  )
                ],
              );
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

  SizedBox buildImageSlider(HotelDetailsState state, BuildContext context) {
    return SizedBox(
      height: 405.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SliderOfHotelImages(hotelPhotoModels: state.hotelPhotoModel!),
          Positioned(
              bottom: 0,
              left: 20.w,
              right: 20.w,
              child: RowOfButtonAndIconButton(hotel: widget.hotelModel,)
          ),
          const BackButton()
        ],
      ),
    );
  }
}

class RowOfButtonAndIconButton extends StatelessWidget {
  final Hotel hotel;
  const RowOfButtonAndIconButton({
    required this.hotel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 254.w,
          height: 60.h,
          child: ElevatedButton(onPressed: () async{
            dl<HotelDetailsBloc>().add(FetchRoomsEvent(currency: hotel.currencyCode!,hotelId:hotel.hotelId! ));
          }, child: const Text(showRooms)),
        ),
        const Spacer(),
        FavouriteIconButton(hotelModel: hotel),
      ],
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 20.h,left: 20.w,
        child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_outlined,color: Colors.black,size: 25,))
    );
  }
}

class SliderOfHotelImages extends StatelessWidget {
  final List<HotelPhotoModel> hotelPhotoModels;
  const SliderOfHotelImages({
    required this.hotelPhotoModels,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 375.h,
      child: PageView.builder(
          itemCount: hotelPhotoModels.length,
          pageSnapping: true,
          itemBuilder: (context,index){
            return  Container(
              height: 375.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(hotelPhotoModels[index].urlMax!)
                  )
              ),
            );
          }),
    );
  }
}
