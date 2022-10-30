import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:realestate/Core/AppTheme/AppColors.dart';
import '../../../../Core/AppTheme/Strings.dart';
import '../../../../Core/ReusableComponantes.dart';
import '../../../../DependencyInjection.dart';
import '../../../SearchForm/domain/entities/Hotel.dart';
import '../manager/FavouriteBloc/favourites_bloc.dart';

class FavouriteIconButton extends StatelessWidget {
  final Hotel hotelModel;
  const FavouriteIconButton({Key? key,required this.hotelModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<FavouriteBloc, FavouriteState>(
      listener: (context, state) {
        if(state.message=="No Internet"){
          showSnackBar(state.message!, context);
        }
      },
      listenWhen: (previous, current) =>  (dl.get<FavouriteBloc>().hotelModelId==hotelModel.hotelId || dl.get<FavouriteBloc>().hotelModelId==-1)&&current.message=="No Internet",
      buildWhen: (previous, current) => dl.get<FavouriteBloc>().hotelModelId==hotelModel.hotelId || dl.get<FavouriteBloc>().hotelModelId==-1,
      builder: (context, state) {
        if(state.message==loading){
          return const Center(child: CircularProgressIndicator(color: primaryColor));
        }
        return  GestureDetector(
            onTap: () {
              context.read<FavouriteBloc>().updateList(hotelModel);
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
                    child: SvgPicture.asset(fillHeartIconAsset,color: context.watch<FavouriteBloc>().getCorrectIconColor(hotelModel)),
                  )
              ),
            )
        );
      },
    );
  }
}
