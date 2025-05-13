import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../data/models/item_model.dart';

class ItemCard extends StatelessWidget {
  final ItemModel item;

  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF262626),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageStack(),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    SvgPicture.asset('assets/images/calendar.svg', height: 16),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        '${item.nights} Nights (${item.dateRange})',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xff999999),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Divider(color: Color(0xff999999), height: 1),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildAvatars(item.avatars),
                    const Spacer(),
                    Text(
                      '${item.unfinishedTasks} unfinished tasks',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xff999999),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageStack() {
    return Stack(
      children: [
        // Top Image
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          child: Image.asset(
            item.imageUrl,
            height: 140,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        // Bottom gradient shadow
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Color(0xFF262626)],
              ),
            ),
          ),
        ),
        // Pending Approval badge
        Positioned(
          top: 110,
          left: 8,
          child: Container(
            height: 28,
            width: 156,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.brown[700],
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xffC25F30), width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Pending Approval',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                const SizedBox(width: 5),
                SvgPicture.asset('assets/images/down.svg'),
              ],
            ),
          ),
        ),
        // Options button
        Positioned(
          top: 8,
          right: 8,
          child: SvgPicture.asset("assets/images/Buttons.svg"),
        ),
      ],
    );
  }

  Widget _buildAvatars(List<String> avatars) {
    const int maxVisible = 3;
    final int extra = avatars.length - maxVisible;
    final int displayCount = avatars.length > maxVisible ? maxVisible + 1 : avatars.length;

    return SizedBox(
      height: 24,
      width: displayCount * 20.0,
      child: Stack(
        children: [
          for (int i = 0; i < avatars.take(maxVisible).length; i++)
            Positioned(
              left: i * 12.0,
              child: CircleAvatar(
                radius: 12,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 11,
                  backgroundImage: NetworkImage(avatars[i]),
                ),
              ),
            ),
          if (extra > 0)
            Positioned(
              left: maxVisible * 12.0,
              child: CircleAvatar(
                radius: 12,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 11,
                  backgroundColor: Colors.grey.shade800,
                  child: Text(
                    '+$extra',
                    style: const TextStyle(
                      color: Color(0xffFFC268),
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
