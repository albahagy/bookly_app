import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/reops/homeRepo/home_repo.dart';
import 'package:bookly/features/home/presentation/manager/bestSellerBooksCubit/best_seller_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/featuredBooksCubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constant.dart';
import 'features/splash/presenation/views/splash_view.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              BestSellerBooksCubit(getIt.get<HomeRepo>())
                ..featchBestSellerBooks(),
        ),
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<HomeRepo>())..fetchFeaturedBooks(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.cairoTextTheme(ThemeData.dark().textTheme),
        ),

        home: SplashView(),
      ),
    );
  }
}
