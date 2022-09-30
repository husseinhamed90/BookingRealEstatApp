import 'package:flutter/material.dart';
import 'package:realestate/Features/Profile/presentation/pages/ProfilePage.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../Features/Favourites/presentation/pages/FavouritesItems/FavouritesItems.dart';
import '../Features/SearchForm/presentation/pages/SearchForm/SearchFormPage.dart';

const SfRangeValues priceValues = SfRangeValues(0.0, 400.0);
const SfRangeValues guestsValues = SfRangeValues(0, 10.0);

List<Widget> pages =[
  const SearchForm(),
  FavouritesItemsPage(),
  const ProfilePage(),
];