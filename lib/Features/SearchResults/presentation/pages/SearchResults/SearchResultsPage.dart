
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/Features/SearchFilters/data/remote/data_sources/RemoteDataSource.dart';
import 'package:realestate/Features/SearchFilters/presentation/manager/filters_bloc.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelModel.dart';
import '../../../../../Core/AppTheme/Strings.dart';
import '../../../../../DependencyInjection.dart';
import '../../widgets/HotelsListPageHeader.dart';
import '../../widgets/HotelsListResult.dart';


class SearchResults extends StatefulWidget {
  SearchResults({Key? key}) : super(key: key);

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        dl.get<FilteringBloc>().add(FetchMore());
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_outlined)),
        centerTitle: true,
        title:  const Text(searchResults),
      ),

      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const HotelsListPageHeader(),
          SliverToBoxAdapter(
            child: SizedBox(height: 20.h,),
          ),
          const HotelsListResult()
        ],
      ),
    );
  }
}