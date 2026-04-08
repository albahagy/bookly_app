import 'package:bookly/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly/features/search/presentation/manager/search_bloc/search_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          const SizedBox(height: 40),
          CustomSearchTextField(
            controller: TextEditingController(),
            onChanged: (query) {
              BlocProvider.of<SearchCubit>(context).featchSearchBooks(query);
            },
          ),
          const SizedBox(height: 10),
          SearchResultListView(),
        ],
      ),
    );
  }
}
