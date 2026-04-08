import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/reops/homeRepo/home_repo.dart';
import 'package:bookly/features/search/data/repo/search_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<HomeRepo>(HomeRepo(ApiService(Dio())));
  getIt.registerSingleton<SearchRepo>(SearchRepo(ApiService(Dio())));
}
