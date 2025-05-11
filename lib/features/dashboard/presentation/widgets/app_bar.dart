import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF0D0D0D),
      elevation: 0,
      title: Row(
        children: [
         SvgPicture.asset(
            'assets/images/logo.svg',
            height: 24,
          ),
          const SizedBox(width: 24),
          if (MediaQuery.of(context).size.width > 700) ...[
            const Text('Items'),
            const SizedBox(width: 16),
            const Text('Pricing'),
            const SizedBox(width: 16),
            const Text('Info'),
            const SizedBox(width: 16),
            const Text('Tasks'),
            const SizedBox(width: 16),
            const Text('Analytics'),
          ],
        ],
      ),
      actions: [
        if (MediaQuery.of(context).size.width > 700)
        SvgPicture.asset(
          'assets/images/setting.svg',
          height: 24,
        ),
        const SizedBox(width: 5),
        SvgPicture.asset(
          'assets/images/notification.svg',
          height: 24,
        ),
        const SizedBox(width: 16),
        const CircleAvatar(backgroundImage: AssetImage('assets/images/avatar.png')),
        const SizedBox(width: 16),
      ],
    );
  }
}
