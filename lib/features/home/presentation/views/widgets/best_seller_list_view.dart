import 'package:bookly/features/home/presentation/manager/bestSellerBooksCubit/best_seller_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/bestSellerBooksCubit/best_seller_books_state.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: BlocBuilder<BestSellerBooksCubit, BestSellerBooksState>(
        builder: (context, state) {
          if (state is BestSellerBooksLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BestSellerBooksSuccess) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BookDetailsView(book: state.books[index]),
                      ),
                    ),
                    child: BestSellerListViewItem(
                      imageUrl:
                          state
                              .books[index]
                              .volumeInfo
                              ?.imageLinks
                              ?.thumbnail ??
                          '',
                      title: state.books[index].volumeInfo?.title ?? 'No Title',
                      author:
                          state.books[index].volumeInfo?.authors?.first ??
                          'No Author',
                      price: 'free',
                      rating: '4.1',
                    ),
                  ),
                );
              },
            );
          } else if (state is BestSellerBooksFailure) {
            return Center(child: Text(state.errorMessage));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
