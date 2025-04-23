import 'package:flutter/material.dart';

import 'homepage_widgets/countrydropsown.dart';
import 'homepage_widgets/dealoftheday.dart';
import 'homepage_widgets/filterbycategory.dart';
import 'homepage_widgets/ourpatners.dart';
import 'homepage_widgets/slider.dart';


class MainContentSection extends StatelessWidget {
  const MainContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
      ),
      child: const Padding(
        padding: EdgeInsets.only(left: 10),
        child: Column(
          children: [
            CategoryFilterScreen(),
            UpcomingDealScreen(),
            SimpleImageSlider(),
            DealOfTheDaySection(),
            PartnersSection(),
          ],
        ),
      ),
    );
  }
}
