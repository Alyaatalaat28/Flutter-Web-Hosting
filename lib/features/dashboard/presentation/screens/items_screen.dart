import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trip_dashboard/features/dashboard/data/models/item_model.dart';
import '../widgets/item_card.dart';
import '../widgets/responsive_layout.dart';

class ItemsScreen extends StatelessWidget {
  ItemsScreen({super.key});

  // Dummy item data
  final List<ItemModel> items = List.generate(
    8,
    (index) => ItemModel(
      title: 'Item title',
      imageUrl: 'assets/images/item.png',
      dateRange: 'Jan 1 - Jan 20, 2024',
      nights: 5,
      unfinishedTasks: 4,
      avatars:
          List.generate(3, (i) => 'https://i.pravatar.cc/150?img=${i + 10}'),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ResponsiveLayout(
        mobileLayout: Padding(
          padding: const EdgeInsets.symmetric(horizontal:16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical:10.0),
                child: Row(children: [
                  Text(
                    'Items',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w200,
                        color: Color(0xffFFFFFF)),
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    'assets/images/filter.svg',
                    height: 34,
                  ),
                ]),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (_, index) => ItemCard(item: items[index]),
                ),
              ),
            ],
          ),
        ),
        webLayout: Padding(
          padding: const EdgeInsets.symmetric(horizontal:16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical:10.0),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                  Text(
                    'Items',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w200,
                        color: Color(0xffFFFFFF)),
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    'assets/images/filter.svg',
                    height: 48,
                    width: 48,
                  ),
                  SizedBox(width: 14),
                  SvgPicture.asset(
                    'assets/images/divider.svg',
                    height:48,
                  ),
                  SizedBox(width: 14),
                  SizedBox(
                    width: 177,
                    height: 48,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffFFC268),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.add, color: Color(0xff000000)),
                      label: const Text('Add a New Item',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff000000))),
                    ),
                  ),
                ]),
              ),
              SizedBox(height: 40),
              Expanded(
                child: GridView.builder(
                  itemCount: items.length,
                  gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    //crossAxisCount: 5,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.85,
                  ),
                  itemBuilder: (_, index) => ItemCard(item: items[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
