import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  final bool isWide;

  const CustomAppBar({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: const Color(0xFF000000),
      elevation: 0,
      title: Row(
        children: [
          if (!isWide) ...[
            SvgPicture.asset('assets/images/menu.svg', height: 24),
            const SizedBox(width: 8),
          ],
          SvgPicture.asset('assets/images/logo.svg', height: 24),
          const Spacer(),
          if (isWide) const _TabBarSection(),
        ],
      ),
      actions: [
        ..._buildActionIcons(),
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatar2.png'),
        ),
        if (isWide) const _UserInfoSection(),
      ],
    );
  }

  List<Widget> _buildActionIcons() {
    const spacing = SizedBox(width: 15);

    return [
      SvgPicture.asset('assets/images/divider.svg', height: 24),
      spacing,
      SvgPicture.asset('assets/images/setting.svg', height: 24),
      spacing,
      SvgPicture.asset('assets/images/notification.svg', height: 24),
      spacing,
      SvgPicture.asset('assets/images/divider.svg', height: 24),
      spacing,
    ];
  }
}

class _TabBarSection extends StatelessWidget {
  const _TabBarSection();

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      isScrollable: true,
      dividerColor: Colors.transparent,
      indicatorColor: Color(0xffFFC268),
      labelColor: Colors.white,
      unselectedLabelColor: Color(0xff999999),
      labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      unselectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
      labelPadding: EdgeInsets.symmetric(horizontal: 15),
      tabs: [
        Tab(text: 'Items'),
        Tab(text: 'Pricing'),
        Tab(text: 'Info'),
        Tab(text: 'Tasks'),
        Tab(text: 'Analytics'),
      ],
    );
  }
}

class _UserInfoSection extends StatelessWidget {
  const _UserInfoSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        const Text(
          'John Doe',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w200,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 4),
        SvgPicture.asset('assets/images/down.svg'),
      ],
    );
  }
}
