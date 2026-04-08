import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../book_details_view.dart';
import 'best_seller_list_view.dart';
import 'custom_home_app_bar.dart';
import 'feature_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                customHomeAppBar(),
                FeaturedListView(),
                SizedBox(height: 50),
                Text('Best Seller', style: Styles.titleMedium),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: BestSellerListView()),
      ],
    );
  }
}
