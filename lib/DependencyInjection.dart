import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:realestate/Core/BottomNavBarBloc/bottom_nav_bar_bloc.dart';
import 'package:realestate/Features/Authentication/data/remote/data_sources/AuthFirebaseDataSource.dart';
import 'package:realestate/Features/Authentication/presentation/manager/auth_bloc.dart';
import 'package:realestate/Features/BookedRooms/data/repositories/FirebaseBookedHotelsRepository.dart';

import 'package:realestate/Features/FlatDetails/data/repositories/RemoteHotelDetailsRepository.dart';
import 'package:realestate/Features/FlatDetails/presentation/manager/HotelDetailsBloc/HotelDetailsBloc.dart';
import 'package:realestate/Features/SearchFilters/data/remote/data_sources/RemoteDataSource.dart';
import 'package:realestate/Features/SearchFilters/data/repositories/LocationsRepository.dart';
import 'package:realestate/Features/SearchFilters/domain/use_cases/FetchLocationsUseCase.dart';
import 'package:realestate/Features/SearchFilters/domain/use_cases/FilterResultsUseCase.dart';
import 'package:realestate/Features/SearchFilters/presentation/manager/DatePickerCubit.dart';
import 'package:realestate/Features/SearchFilters/presentation/manager/filters_bloc.dart';
import 'package:realestate/Features/SearchFilters/presentation/manager/sliders_cubit.dart';
import 'package:realestate/Features/SearchForm/data/remote/data_sources/RemoteSearchFormDataSource.dart';
import 'package:realestate/Features/SearchForm/data/repositories/RemoteSearchFormRepository.dart';
import 'package:realestate/Features/FlatDetails/domain/use_cases/FetchHomePhotosUseCase.dart';
import 'package:realestate/Features/FlatDetails/domain/use_cases/FetchHotelDescriptionUseCase.dart';
import 'package:realestate/Features/FlatDetails/domain/use_cases/FetchHotelDetailsUseCase.dart';
import 'package:realestate/Features/FlatDetails/domain/use_cases/FetchHotelRoomsUseCase.dart';
import 'package:realestate/Features/SearchForm/domain/use_cases/FetchNearestHotelsUseCase.dart';
import 'package:realestate/Features/SearchForm/presentation/manager/HotelsByCoordinatedBloc/hotels_by_coordinates_bloc.dart';
import 'Core/NavigationService/NavigationService.dart';
import 'Features/BookedRooms/data/remote/data_sources/BookedHotelsFirebaseDataSource.dart';
import 'Features/BookedRooms/presentation/manager/booked_rooms_bloc.dart';
import 'Features/Favourites/data/data_sources/LocalDataSource/FavouritesHiveDataSource.dart';
import 'Features/Favourites/data/data_sources/RemoteDataSource/FavouritesFirebaseDataSource.dart';
import 'Features/Favourites/data/repositories/FirebaseDataSourceRepo.dart';
import 'Features/Favourites/data/repositories/HiveDataSourceRepo.dart';
import 'Features/Favourites/presentation/manager/FavouriteBloc/favourites_bloc.dart';
import 'Features/FlatDetails/data/remote/data_sources/RemoteHotelDetailsDataSource.dart';

import 'Features/SearchForm/domain/entities/Hotel.dart';

final dl = GetIt.instance;

init(){
  Hive.registerAdapter(HotelAdapter());
  Hive.registerAdapter(CompositePriceBreakdownAdapter());
  Hive.registerAdapter(GrossAmountAdapter());
  Hive.registerAdapter(ProductPriceBreakdownsAdapter());

  dl.registerLazySingleton<BottomNavBarBloc>(() => BottomNavBarBloc());
  dl.registerLazySingleton<FilteringBloc>(() => FilteringBloc());
  dl.registerLazySingleton<HotelsByCoordinatesBloc>(() => HotelsByCoordinatesBloc());
  dl.registerLazySingleton<HotelDetailsBloc>(() => HotelDetailsBloc());
  dl.registerLazySingleton<FavouriteBloc>(() => FavouriteBloc());
  dl.registerLazySingleton<AuthBloc>(() => AuthBloc());
  dl.registerLazySingleton<BookedRoomsBloc>(() => BookedRoomsBloc());
  dl.registerLazySingleton<DatePickerCubit>(() => DatePickerCubit());
  dl.registerLazySingleton<SlidersCubit>(() => SlidersCubit());

  dl.registerLazySingleton(() => NavigationService());

  dl.registerLazySingleton<FirebaseBookedHotelsRepository>(() => FirebaseBookedHotelsRepository(dl()));
  dl.registerLazySingleton<LocationsRepository>(() => LocationsRepository(dl()));
  dl.registerLazySingleton<FirebaseDataSourceRepo>(() => FirebaseDataSourceRepo(dl()));
  dl.registerLazySingleton<FavouritesHiveDataSourceRepo>(() => FavouritesHiveDataSourceRepo(dl()));
  dl.registerLazySingleton<RemoteSearchFormRepository>(() => RemoteSearchFormRepository(dl()));
  dl.registerLazySingleton<RemoteHotelDetailsRepository>(() => RemoteHotelDetailsRepository(dl()));

  dl.registerLazySingleton<BookedHotelsFirebaseDataSource>(() => BookedHotelsFirebaseDataSource());
  dl.registerLazySingleton<FavouritesHiveDataSource>(() => FavouritesHiveDataSource());
  dl.registerLazySingleton<FavouritesFirebaseDataSource>(() => FavouritesFirebaseDataSource());
  dl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource());
  dl.registerLazySingleton<RemoteSearchFormDataSource>(() => RemoteSearchFormDataSource());
  dl.registerLazySingleton<RemoteHotelDetailsDataSource>(() => RemoteHotelDetailsDataSource());
  dl.registerLazySingleton<AuthFirebaseDataSource>(() => AuthFirebaseDataSource());

  dl.registerLazySingleton<FetchLocationsUseCase>(() => FetchLocationsUseCase(dl()));
  dl.registerLazySingleton<FetchNearestHotelsUseCase>(() => FetchNearestHotelsUseCase(dl()));
  dl.registerLazySingleton<FetchHotelRoomsUseCase>(() => FetchHotelRoomsUseCase(dl()));
  dl.registerLazySingleton<FilterResultsUseCase>(() => FilterResultsUseCase(dl()));
  dl.registerLazySingleton<FetchHotelDetailsUseCase>(() => FetchHotelDetailsUseCase(dl()));
  dl.registerLazySingleton<FetchHotelPhotosUseCase>(() => FetchHotelPhotosUseCase(dl()));
  dl.registerLazySingleton<FetchHotelDescriptionUseCase>(() => FetchHotelDescriptionUseCase(dl()));

}