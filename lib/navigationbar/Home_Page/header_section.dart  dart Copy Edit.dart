import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_page_controller/homepage_controller.dart';


class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomepageController>();

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: const BoxDecoration(color: Color(0xffd5f4ed)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTapDown: (details) => _showCountryMenu(context, details.globalPosition, controller),
                    child: Obx(() => Row(
                      children: [
                        Text(controller.selectedCountry.value),
                        const Icon(Icons.keyboard_arrow_down),
                      ],
                    )),
                  ),
                  Image.asset("images/Deelly Logo.png"),
                  Padding(
                    padding: const EdgeInsets.only(right: 16, top: 10),
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topRight,
                      children: [
                        const Icon(Icons.shopping_cart, size: 30, color: Color(0xFF2B6B5E)),
                        Positioned(
                          right: -5,
                          top: -10,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                            child: const Text('03', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCountryMenu(BuildContext context, Offset offset, HomepageController controller) async {
    final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;

    String? selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(offset, offset),
        Offset.zero & overlay.size,
      ),
      items: controller.countries.map((String country) {
        return PopupMenuItem<String>(
          value: country,
          child: Text(country),
        );
      }).toList(),
    );

    if (selected != null) {
      controller.changeCountry(selected);
    }
  }
}
