import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class UpcomingDealScreen extends StatefulWidget {
  const UpcomingDealScreen({super.key});

  @override
  State<UpcomingDealScreen> createState() => _UpcomingDealScreenState();
}

class _UpcomingDealScreenState extends State<UpcomingDealScreen> {
  int selectedIndex = 0;

  List<DateTime> getNext7Days() {
    final today = DateTime.now();
    return List.generate(7, (index) => today.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    final dates = getNext7Days();

    return
      Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Upcoming Deal',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  final date = dates[index];
                  final isToday = DateUtils.isSameDay(date, DateTime.now());

                  final isSelected = index == selectedIndex;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFFCFF0E8) : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFF2B6B5E)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat('d').format(date),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF2B6B5E),
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            isToday ? 'Today' : DateFormat('MMM').format(date),
                            style: TextStyle(
                              color: const Color(0xFF2B6B5E),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
    );
  }
}
