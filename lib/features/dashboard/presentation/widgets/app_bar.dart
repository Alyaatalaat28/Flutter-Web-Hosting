import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  final bool isWide;

  const CustomAppBar({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor:Colors.transparent,
      backgroundColor: const Color(0xFF0D0D0D),
      elevation: 0,
      title: Row(
        children: [
          SvgPicture.asset(
            'assets/images/logo.svg',
            height: 24,
          ),
          Spacer(),
          if (isWide)
            const TabBar(
              isScrollable: true,
              indicatorColor: Color(0xffFFC268),
              labelColor: Color(0xffFFFFFF),
              unselectedLabelColor: Color(0xff999999),
              labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              unselectedLabelStyle:
                  TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
              labelPadding: EdgeInsets.symmetric(horizontal: 32),
              tabs: [
                Tab(text: 'Items'),
                Tab(text: 'Pricing'),
                Tab(text: 'Info'),
                Tab(text: 'Tasks'),
                Tab(text: 'Analytics'),
              ],
            ),
        ],
      ),
      actions: [
        SvgPicture.asset(
               'assets/images/divider.svg',
                height: 24,
              ),
        const SizedBox(width: 24),
        SvgPicture.asset(
          'assets/images/setting.svg',
          height: 24,
        ),
        const SizedBox(width: 24),
        SvgPicture.asset(
          'assets/images/notification.svg',
          height: 24,
        ),
        const SizedBox(width: 24),
        SvgPicture.asset(
               'assets/images/divider.svg',
                height: 24,
              ),
         const SizedBox(width: 24),
        const CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.png')),
        const SizedBox(width: 5),
        Row(
          children: [
            Text('John Doe',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200,color:Color(0xffFFFFFF)),),
            const SizedBox(width: 4),
            SvgPicture.asset('assets/images/down.svg',
            height:24,),
            const SizedBox(width: 24),
          ],
        )
      ],
    );
  }
}
