import 'package:bookly/features/home/data/reops/homeRepo/home_repo.dart';
import 'package:bookly/features/home/presentation/manager/bestSellerBooksCubit/best_seller_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerBooksCubit extends Cubit<BestSellerBooksState> {
  final HomeRepo homeRepo;
  BestSellerBooksCubit(this.homeRepo) : super(BestSellerBooksInitial());

  Future<void> featchBestSellerBooks() async {
    emit(BestSellerBooksLoading());
    var result = await homeRepo.featchBestSellerBooks();
    result.fold(
      (failurs) {
        emit(BestSellerBooksFailure(failurs.toString()));
      },
      (books) {
        emit(BestSellerBooksSuccess(books));
      },
    );
  }
}
