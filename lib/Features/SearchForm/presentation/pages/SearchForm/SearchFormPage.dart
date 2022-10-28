import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate/Features/SearchForm/presentation/manager/HotelsByCoordinatedBloc/hotels_by_coordinates_bloc.dart';
import '../../../../../Core/AppTheme/Strings.dart';
import '../../../../../Core/ResuableWidgets/NoConnectionImage.dart';
import '../../../../../Core/ReusableComponantes.dart';
import '../../../../../DependencyInjection.dart';
import '../../widgets/SearchFormBody.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelsByCoordinatesBloc,HotelsByCoordinatesState>(
      listener: (context, state) {
         if(state.errorMessage!=null){
           showSnackBar(state.errorMessage!.message,context);
        }
      },
      builder: (context, state) {
        if(state.message!.message==loading){
          return buildDownloadIndicator(context);
        }
        if(state.errorMessage!=null){
          return  NoConnectionImage(eventCommand: dl.get<HotelsByCoordinatesBloc>());
        }
        else{
          return SearchFormBody(hotels: state.hotels!,);
        }
      },
    );
  }
}

