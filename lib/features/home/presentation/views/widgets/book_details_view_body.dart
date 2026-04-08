import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/data/reops/homeRepo/home_repo.dart';
import 'package:bookly/features/home/presentation/manager/similarBooksCubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/BookWebView.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_listView_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'book_details_list_view.dart';
import 'book_details_rating.dart';
import 'books_action.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          const SizedBox(height: 16),
          CustomBookDetailsAppBar(),
          const SizedBox(height: 15),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.30,
            child: CustomListViewItem(
              imageUrl: '${book.volumeInfo?.imageLinks?.thumbnail}',
            ),
          ),
          const SizedBox(height: 20),
          BookDetailsRating(
            title: '${book.volumeInfo?.title}',
            author: '${book.volumeInfo?.authors?.first}',
            rating: '4.1',
            ratingCount: '173',
          ),
          const SizedBox(height: 25),
          BooksAction(url: book.volumeInfo?.previewLink ?? ''),
          Expanded(child: const SizedBox(height: 20)),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Similar Books',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          BlocProvider(
            create: (context) =>
                SimilarBooksCubit(getIt.get<HomeRepo>())..featchSimilarBooks(),
            child: BookDetailsListView(),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
