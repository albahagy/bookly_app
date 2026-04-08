import 'package:bookly/core/utils/assets_data.dart';
import 'package:bookly/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class customHomeAppBar extends StatelessWidget {
  const customHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
      child: Row(
        children: [
          Image.asset(AssetsData.logo, height: 18),
          const Spacer(),
          IconButton(
            onPressed: () {
              Get.to(() => SearchView());
            },
            icon: FaIcon(FontAwesomeIcons.magnifyingGlass, size: 21),
          ),
        ],
      ),
    );
  }
}
