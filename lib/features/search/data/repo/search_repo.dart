import 'package:bookly/core/errors/failurs.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

class SearchRepo {
  final ApiService apiService;
  SearchRepo(this.apiService);

  Future<Either<Failures, List<BookModel>>> searchBooks(String query) async {
    try {
      var data = await apiService.get(endPoint: 'volumes?q=$query');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
