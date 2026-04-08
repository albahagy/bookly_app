import 'package:bookly/features/home/data/reops/homeRepo/home_repo.dart';
import 'package:bookly/features/home/presentation/manager/featuredBooksCubit/featured_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final HomeRepo homeRepo;
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.featchFeaturedBooks();
    result.fold(
      (failurs) {
        emit(FeaturedBooksFailure(failurs.errMessage));
      },
      (books) {
        emit(FeaturedBooksSuccess(books));
      },
    );
  }
}
