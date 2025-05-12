import 'package:flutter/material.dart';
import 'package:trip_dashboard/features/dashboard/presentation/screens/items_screen.dart';
import '../widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
Widget build(BuildContext context) {
  final isWide = MediaQuery.of(context).size.width > 700;

  return DefaultTabController(
    length: 5,
    child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(isWide ? 80 : kToolbarHeight),
        child: CustomAppBar(isWide: isWide),
      ),
      body: isWide ? TabBarView(
        children: [
          ItemsScreen(),
          ItemsScreen(),
          ItemsScreen(),
          ItemsScreen(),
          ItemsScreen(),
        ],
      ) :  ItemsScreen(), // mobile just shows items
    ),
  );
}
}