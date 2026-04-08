import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class BestSellerBooksState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BestSellerBooksInitial extends BestSellerBooksState {}

class BestSellerBooksSuccess extends BestSellerBooksState {
  final List<BookModel> books;
  BestSellerBooksSuccess(this.books);
}

class BestSellerBooksFailure extends BestSellerBooksState {
  final String errorMessage;
  BestSellerBooksFailure(this.errorMessage);
}

class BestSellerBooksLoading extends BestSellerBooksState {}
