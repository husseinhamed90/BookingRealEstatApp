import 'package:flutter/material.dart';
import 'package:realestate/Features/Profile/presentation/pages/ProfilePage.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../Features/Booked/presentation/pages/BookedItems/BookedItemspage.dart';
import '../Features/Favourites/presentation/pages/FavouritesItems/FavouritesItems.dart';
import '../Features/SearchForm/presentation/pages/SearchForm/SearchFormPage.dart';

SfRangeValues priceValues = const SfRangeValues(0.0, 400.0);
SfRangeValues guestsValues = const SfRangeValues(0, 10.0);

String API_KEY ="31e8d16195mshb38f5e68da66b96p157d02jsnb27baefb7778";

String BASE_URL ="https://booking-com.p.rapidapi.com/v1/hotels";


List<Widget> pages =[
  const SearchForm(),
  // BookedItemsPage(hotelBlockModel: []),
  FavouritesItemsPage(),
  const ProfilePage(),
];