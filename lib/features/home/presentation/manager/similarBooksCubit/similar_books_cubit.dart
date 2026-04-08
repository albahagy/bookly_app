import 'package:bookly/features/home/data/reops/homeRepo/home_repo.dart';
import 'package:bookly/features/home/presentation/manager/similarBooksCubit/similar_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  final HomeRepo homeRepo;
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  Future<void> featchSimilarBooks() async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.featchSimilarBooks();
    result.fold(
      (failure) {
        emit(SimilarBooksFailure(failure.errMessage));
      },
      (books) {
        emit(SimilarBooksSuccess(books));
      },
    );
  }
}
