import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate/Core/AppTheme/Strings.dart';
import 'package:realestate/Features/SearchFilters/presentation/manager/filters_bloc.dart';
import 'package:realestate/Features/SearchResults/presentation/pages/SearchResults/SearchResultsPage.dart';
import '../../../../../Core/ReusableComponantes.dart';
import '../../widgets/FilteringPageBody.dart';

class SearchFiltersPage extends StatelessWidget {
  const SearchFiltersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(searchFilters),
        centerTitle: true,
      ),
      body: BlocConsumer<FilteringBloc, FilteringState>(
        listener: (context, state) {
          if (state.message!.message == "result loaded") {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchResults(),));
          }
          else if(state.errorMessage!=null){
            showSnackBar(state.errorMessage!.message, context);
          }
        },
        builder: (context, state) {
          if (state.message!.message == loading) {
            return buildDownloadIndicator(context);
          }
          return const FilteringPageBody();
        },
      ),
    );
  }
}


