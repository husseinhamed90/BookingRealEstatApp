import 'package:get_it/get_it.dart';
import 'package:realestate/Core/BottomNavBarBloc/bottom_nav_bar_bloc.dart';
import 'package:realestate/Features/FlatDetails/presentation/manager/SearchResultsBloc/HotelDetailsBloc.dart';
import 'package:realestate/Features/FlatDetails/presentation/manager/favourite_cubit.dart';
import 'package:realestate/Features/SearchFilters/data/remote/data_sources/RemoteDataSource.dart';
import 'package:realestate/Features/SearchFilters/data/repositories/LocationsRepository.dart';
import 'package:realestate/Features/SearchFilters/domain/use_cases/FetchLocationsUseCase.dart';
import 'package:realestate/Features/SearchFilters/domain/use_cases/FilterResultsUseCase.dart';
import 'package:realestate/Features/SearchFilters/presentation/manager/filters_bloc.dart';
import 'package:realestate/Features/SearchForm/data/remote/data_sources/RemoteSearchFormDataSource.dart';
import 'package:realestate/Features/SearchForm/data/repositories/RemoteSearchFormRepository.dart';
import 'package:realestate/Features/SearchForm/domain/use_cases/FetchHomePhotosUseCase.dart';
import 'package:realestate/Features/SearchForm/domain/use_cases/FetchHotelDescriptionUseCase.dart';
import 'package:realestate/Features/SearchForm/domain/use_cases/FetchHotelDetailsUseCase.dart';
import 'package:realestate/Features/SearchForm/domain/use_cases/FetchHotelRoomsUseCase.dart';
import 'package:realestate/Features/SearchForm/domain/use_cases/FetchNearestHotelsUseCase.dart';
import 'package:realestate/Features/SearchForm/presentation/manager/HotelsByCoordinatedBloc/hotels_by_coordinates_bloc.dart';


final dl = GetIt.instance;

init(){
  dl.registerLazySingleton<BottomNavBarBloc>(() => BottomNavBarBloc());
  dl.registerLazySingleton<FilteringBloc>(() => FilteringBloc());
  dl.registerLazySingleton<HotelsByCoordinatesBloc>(() => HotelsByCoordinatesBloc());
  dl.registerLazySingleton<HotelDetailsBloc>(() => HotelDetailsBloc());
  dl.registerLazySingleton<FavouriteCubit>(() => FavouriteCubit());


  dl.registerLazySingleton<LocationsRepository>(() => LocationsRepository(dl()));
  dl.registerLazySingleton<RemoteSearchFormRepository>(() => RemoteSearchFormRepository(dl()));

  dl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource());
  dl.registerLazySingleton<RemoteSearchFormDataSource>(() => RemoteSearchFormDataSource());


  dl.registerLazySingleton<FetchLocationsUseCase>(() => FetchLocationsUseCase(dl()));
  dl.registerLazySingleton<FetchNearestHotelsUseCase>(() => FetchNearestHotelsUseCase(dl()));
  dl.registerLazySingleton<FetchHotelRoomsUseCase>(() => FetchHotelRoomsUseCase(dl()));
  dl.registerLazySingleton<FilterResultsUseCase>(() => FilterResultsUseCase(dl()));
  dl.registerLazySingleton<FetchHotelDetailsUseCase>(() => FetchHotelDetailsUseCase(dl()));
  dl.registerLazySingleton<FetchHotelPhotosUseCase>(() => FetchHotelPhotosUseCase(dl()));
  dl.registerLazySingleton<FetchHotelDescriptionUseCase>(() => FetchHotelDescriptionUseCase(dl()));

}