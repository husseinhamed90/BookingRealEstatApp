import 'package:flutter/material.dart';
import 'package:realestate/Features/Profile/presentation/pages/ProfilePage.dart';
import 'package:realestate/Features/BookedRooms/presentation/pages/booked_rooms.dart';
import '../Features/Favourites/presentation/pages/FavouritesItems/FavouritesItems.dart';
import '../Features/SearchForm/presentation/pages/SearchForm/SearchFormPage.dart';

List<Widget> pages =[
  const SearchForm(),
  const BookedRooms(blocks: []),
  const FavouritesItemsPage(),
  const ProfilePage(),
];