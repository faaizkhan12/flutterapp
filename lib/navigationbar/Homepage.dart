import 'package:flutter/material.dart';

import '../widgets/countrydropsown.dart';
import '../widgets/dealoftheday.dart';
import '../widgets/filterbycategory.dart';
import '../widgets/ourpatners.dart';
import '../widgets/slider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> _countries = ['UAE', 'USA', 'PAK', 'IND',];
  String _selectedCountry = 'UAE';

  void _showCountryMenu(BuildContext context, Offset offset) async {
    final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;

    String? selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(offset, offset),
        Offset.zero & overlay.size,
      ),
      items: _countries.map((String country) {
        return PopupMenuItem<String>(
          value: country,
          child: Text(country),
        );
      }).toList(),
    );

    if (selected != null) {
      setState(() {
        _selectedCountry = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children:[ Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffd5f4ed)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTapDown: (TapDownDetails details) {
                                _showCountryMenu(context, details.globalPosition);
                              },
                              child: Row(
                                children: [
                                  Text(_selectedCountry),
                                  const Icon(Icons.keyboard_arrow_down),
                                ],
                              ),
                            ),
                            Image.asset("images/Group 1000007000.png",width: 89.9,height: 29,),
                            Padding(
                              padding: const EdgeInsets.only(right: 16, top: 10), // Pushes icon away from screen edge
                              child: Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.topRight,
                                children: [
                                  const Icon(
                                    Icons.shopping_cart,
                                    size: 30,
                                    color: Color(0xFF2B6B5E),
                                  ),
                                  Positioned(
                                    right: -5,
                                    top: -10,
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      constraints: const BoxConstraints(
                                        minWidth: 10,
                                        minHeight: 10,
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '03',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 8,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )

                          ],
                        ),
                        const SizedBox(height: 20,),
                    Row(
                      children: [
                        // Search Box
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: const Row(
                              children: [
                                Icon(Icons.search, color: Colors.grey),
                                SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Search...',
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Filter Button
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xff5ACD84), Color(0xff56AEFF)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(Icons.filter, color: Colors.white),
                        ),
                      ],
                    ),
                        const SizedBox(height: 20,),
                      ],
                    ),
                  ),
                ),
              ),
             Positioned(
               top: 160,
               left: 0,
               right: 0,
               child: Container(
                 decoration: const BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(12),
                     topRight: Radius.circular(12),
                 ),
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
               ),
             ),

            ],
          ),
       ] ),
      ),
    );
  }
}
