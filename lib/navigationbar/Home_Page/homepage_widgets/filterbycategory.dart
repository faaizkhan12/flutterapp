import 'package:flutter/material.dart';
class CategoryFilterScreen extends StatelessWidget {
  const CategoryFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Filter By Category',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CategoryItem(
                  icon: Icons.table_restaurant,
                  label: 'Dinning',
                ),
                CategoryItem(
                  icon: Icons.spa,
                  label: 'Saloon/Spa',
                ),
                CategoryItem(
                  icon: Icons.movie,
                  label: 'Entertainment',
                ),
                CategoryItem(
                  icon: Icons.cleaning_services,
                  label: 'Cleaning',
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 12),
            child: Divider(color: Colors.grey[300],),
          ),
          const SizedBox(height: 10),
          const Text(
            'Filter By Discount',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: [
              discountChip('Up to 10%'),
              discountChip('Up to 20%'),
              discountChip('Up to 30%'),
              // Add more if needed
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 12,top: 10,bottom: 10),
            child: Divider(color: Colors.grey[300],),
          ),
        ],
      ),
    );
  }

  Widget discountChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.white,
      labelStyle: const TextStyle(color: Colors.grey),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.pink[50],
            child: Icon(icon, size: 30, color: Colors.black54),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
