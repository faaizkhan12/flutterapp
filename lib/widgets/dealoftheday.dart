import 'package:flutter/material.dart';
class DealOfTheDaySection extends StatelessWidget {
  const DealOfTheDaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Deal of the day",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 275,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                DealCard(
                  imagePath: 'images/Rectangle 34624588.png',
                  title: 'Ristorante – Niko Romito',
                  subtitle: 'Dine and enjoy a 20% Discount',
                  location: 'Ristorante L’Olivo at Al Maha',
                  rating: 5.0,
                  reviews: 7,
                  sold: 7350,
                ),
                DealCard(
                  imagePath: 'images/Rectangle 34624588.png',
                  title: 'Ristorante – Example',
                  subtitle: 'Dine and enjoy a 30% Discount',
                  location: 'Burj Al Arab',
                  rating: 5.0,
                  reviews: 7,
                  sold: 5100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DealCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String location;
  final double rating;
  final int reviews;
  final int sold;

  const DealCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.sold,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  imagePath,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "30% off",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.favorite_border, color: Colors.white),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: Colors.grey),
                    Expanded(
                      child: Text(
                        '$location +5 more',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.green, size: 16),
                    Text('$rating ($reviews reviews)', style: const TextStyle(fontSize: 12)),
                    const Spacer(),
                    Text('Sold: $sold', style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
