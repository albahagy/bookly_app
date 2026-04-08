import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  final List<BookModel> books;
  SearchSuccessState(this.books);
}

class SearchFailureState extends SearchState {
  final String errorMessage;
  SearchFailureState(this.errorMessage);
}
