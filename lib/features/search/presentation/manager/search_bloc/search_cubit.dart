import 'package:bookly/features/search/data/repo/search_repo.dart';
import 'package:bookly/features/search/presentation/manager/search_bloc/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;
  SearchCubit(this.searchRepo) : super(SearchInitialState());
  Future<void> featchSearchBooks(String query) async {
    emit(SearchLoadingState());
    var result = await searchRepo.searchBooks(query);
    result.fold(
      (failure) {
        emit(SearchFailureState(failure.errMessage));
      },
      (books) {
        emit(SearchSuccessState(books));
      },
    );
  }
}
