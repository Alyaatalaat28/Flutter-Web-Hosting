import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/app_bar.dart';
import '../widgets/item_card.dart';
import '../widgets/responsive_layout.dart';
import '../../data/models/item_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ItemModel> items = List.generate(
      8,
      (index) => ItemModel(
        title: index.isEven ? 'Item title' : 'Long item title highlighting how long',
        imageUrl: 'assets/images/item.png',
        dateRange: 'Jan 1 - Jan 20, 2024',
        nights: 5,
        unfinishedTasks: 4,
        avatars: List.generate(3, (i) => 'https://i.pravatar.cc/150?img=${i + 10}'),
      ),
    );

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(),
      ),
      body:Stack(
  children: [
    Padding(
      padding: const EdgeInsets.all(16),
      child: ResponsiveLayout(
        mobileLayout: ListView.builder(
          itemCount: items.length,
          itemBuilder: (_, i) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: ItemCard(item: items[i]),
          ),
        ),
        webLayout: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemCount: items.length,
          itemBuilder: (_, i) => ItemCard(item: items[i]),
        ),
      ),
    ),

    // Floating button at top right
    Positioned(
      top: 0,
      right: 80, // adjust based on spacing from filter icon
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor:Color(0xffFFC268),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {},
        icon: const Icon(Icons.add, color: Colors.black),
        label: const Text('Add a New Item', style: TextStyle(color: Colors.black)),
      ),
    ),

    Positioned(
      top: 12,
      right: 16,
      child: SvgPicture.asset(
        'assets/images/filter.svg',
        height: 24,
    )),
  ],
),

    );
  }
}
