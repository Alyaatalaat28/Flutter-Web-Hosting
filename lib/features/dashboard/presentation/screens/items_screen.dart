import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trip_dashboard/features/dashboard/data/models/item_model.dart';
import '../widgets/item_card.dart';
import '../widgets/responsive_layout.dart';

class ItemsScreen extends StatelessWidget {
  ItemsScreen({super.key});

  final List<ItemModel> items = List.generate(
    8,
    (index) => ItemModel(
      title: 'Item title',
      imageUrl: 'assets/images/item.png',
      dateRange: 'Jan 1 - Jan 20, 2024',
      nights: 5,
      unfinishedTasks: 4,
      avatars: List.generate(3, (i) => 'https://i.pravatar.cc/150?img=${i + 10}'),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ResponsiveLayout(
        mobileLayout: _buildMobileLayout(),
        webLayout: _buildWebLayout(),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 10),
          _buildHeader(isWeb: false),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (_, index) => ItemCard(item: items[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWebLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 10),
          _buildHeader(isWeb: true),
          const SizedBox(height: 40),
          Expanded(
            child: GridView.builder(
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (_, index) => ItemCard(item: items[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader({required bool isWeb}) {
    return Row(
      children: [
        Text(
          'Items',
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w200,
            color: Color(0xffFFFFFF),
          ),
        ),
        const Spacer(),
        SvgPicture.asset(
          'assets/images/filter.svg',
          height: isWeb ? 48 : 34,
          width: isWeb ? 48 : null,
        ),
        if (isWeb) ...[
          const SizedBox(width: 14),
          SvgPicture.asset('assets/images/divider.svg', height: 48),
          const SizedBox(width: 14),
          _buildAddButton(),
        ],
      ],
    );
  }

  Widget _buildAddButton() {
    return SizedBox(
      width: 177,
      height: 48,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffFFC268),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        onPressed: () {},
        icon: const Icon(Icons.add, color: Color(0xff000000)),
        label: const Text(
          'Add a New Item',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff000000),
          ),
        ),
      ),
    );
  }
}
