import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/Core/AppTheme/Strings.dart';
import 'package:realestate/Features/FlatDetails/presentation/manager/SearchResultsBloc/HotelDetailsState.dart';
import 'package:realestate/Features/Rooms/presentation/pages/HotelRooms/HotelRoomsPage.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../Core/AppTheme/AppColors.dart';
import '../../../../Core/ResuableWidgets/NoConnectionImage.dart';
import '../../../../Core/ReusableComponantes.dart';
import '../../../../DependencyInjection.dart';
import '../../../FavouriteIcon/presentation/manager/FavouriteIconCubit/favourite_cubit.dart';
import '../../../SearchForm/domain/entities/Hotel.dart';
import '../manager/SearchResultsBloc/HotelDetailsBloc.dart';


class ItemDetails extends StatefulWidget {
  final Hotel hotelModel;
  const ItemDetails({Key? key,required this.hotelModel}) : super(key: key);

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {

  late Function onTryAgain;
  @override
  void initState() {
    super.initState();
    onTryAgain=(){
      dl<HotelDetailsBloc>().add(FetchHotelDetailsEvent(hotelModel: widget.hotelModel));
    };
    onTryAgain();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<HotelDetailsBloc,HotelDetailsState>(
          builder: (context, state) {
            if(state.errorMessage!.message==loading){
              return buildDownloadIndicator(context);
            }
            else if(state.errorMessage!.message=="No Internet"||state.hotelDetailsModel==null||state.hotelDescriptionModel==null||state.hotelPhotoModel==null){
              return  NoConnectionImage(onTryAgain: () {
                onTryAgain();
              },);
            }
            else{
               return ListView(
                children: [
                  SizedBox(
                    height: 405.h,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SizedBox(
                          height: 375.h,
                          child: PageView.builder(
                              itemCount: state.hotelPhotoModel!.length,
                              pageSnapping: true,
                              itemBuilder: (context,index){
                                return  Container(
                                  height: 375.h,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(state.hotelPhotoModel![index].urlMax!)
                                      )
                                  ),
                                );
                              }),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 20.w,
                          right: 20.w,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 254.w,
                                height: 60.h,
                                child: ElevatedButton(onPressed: () async{
                                  onTryAgain=(){
                                    dl<HotelDetailsBloc>().add(FetchRoomsEvent(currency: widget.hotelModel.currencyCode!,hotelId:widget.hotelModel.hotelId! ));
                                  };
                                  onTryAgain();
                                }, child: const Text(showRooms)),
                              ),
                              const Spacer(),
                              BlocBuilder<FavouriteCubit,FavouriteState>(
                                builder: (context, state) {
                                  return GestureDetector(
                                    onTap: () {
                                      context.read<FavouriteCubit>().updateList(widget.hotelModel);
                                    },
                                    child: Card(
                                      elevation: 0.5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                      child:  Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          height: 40.h,width: 40.h,
                                          child: Padding(
                                            padding:  EdgeInsets.all(12.h),
                                            child: SvgPicture.asset(fillHeartIconAsset,color: context.watch<FavouriteCubit>().getCorrectIconColor(widget.hotelModel))),
                                          )
                                      ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                            top: 20.h,left: 20.w,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(Icons.arrow_back_outlined,color: Colors.black,size: 25,)))
                      ],
                    ),
                  ),
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
            if(state.errorMessage!.message=="Hotel Rooms Loaded"){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HotelRoomsPage(hotelBlockModel: state.hotelBlockModel!),));
            }
            else if(state.errorMessage!.message=="Error When Fetching Hotel Details"||state.errorMessage!.message=="Error When Fetching Hotels Rooms"){
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
