import 'package:flutter/material.dart';
import 'package:realestate/Features/Profile/presentation/pages/ProfilePage.dart';
import '../Features/Favourites/presentation/pages/FavouritesItems/FavouritesItems.dart';
import '../Features/SearchForm/presentation/pages/SearchForm/SearchFormPage.dart';



List<Widget> pages =[
  const SearchForm(),
  FavouritesItemsPage(),
  const ProfilePage(),
];