import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/search/data/repo/search_repo.dart';
import 'package:bookly/features/search/presentation/manager/search_bloc/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchCubit(getIt.get<SearchRepo>())..featchSearchBooks(''),
      child: Scaffold(body: SearchViewBody()),
    );
  }
}
