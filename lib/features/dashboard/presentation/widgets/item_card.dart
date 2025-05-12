import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(item.imageUrl,
                    height: 140, width: double.infinity, fit: BoxFit.cover),
              ),
              Positioned(
                top:100 ,
                left: 8,
                child: Container(
                  height:28,
                  width: 156,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.brown[700],
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Color(0xffC25F30),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Text('Pending Approval',
                          style: TextStyle(fontSize: 12)),
                        SizedBox(width: 4),
                      SvgPicture.asset(
                        'assets/images/down.svg',
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
               Positioned(
                top: 8,
                right: 8,
                child: Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: Color(0xFF262626),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.more_vert, color: Colors.white)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    SvgPicture.asset('assets/images/calendar.svg', height: 16),
                    const SizedBox(width: 4),
                    Text('${item.nights} Nights (${item.dateRange})',
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    ...item.avatars.map((url) => Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: CircleAvatar(
                              radius: 10, backgroundImage: NetworkImage(url)),
                        )),
                    const Spacer(),
                    Text('${item.unfinishedTasks} unfinished tasks',
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
