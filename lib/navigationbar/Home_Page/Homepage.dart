import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/navigationbar/Home_Page/search_filter_bar.dart';
import '../../controller/home_page_controller/homepage_controller.dart';
import 'header_section.dart  dart Copy Edit.dart';
import 'main_content_section.dart';


class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomepageController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeaderSection(),
            SearchFilterBar(),
            MainContentSection(),
          ],
        ),
      ),
    );
  }
}
