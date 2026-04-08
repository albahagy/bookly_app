import 'package:bookly/core/errors/failurs.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  final ApiService apiService;
  HomeRepo(this.apiService);
  @override
  Future<Either<Failures, List<BookModel>>> featchFeaturedBooks() async {
    try {
      var data = await apiService.get(endPoint: 'volumes?q=subject:flutter');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure(' ${e.message}'));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failures, List<BookModel>>> featchBestSellerBooks() async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?q=subject:programming',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure(' ${e.message}'));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> featchSimilarBooks() async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?filter=free-ebooks&sorting=relevance&q=programming',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure(' ${e.message}'));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
