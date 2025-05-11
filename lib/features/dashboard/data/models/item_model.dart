class ItemModel {
  final String title;
  final String imageUrl;
  final String dateRange;
  final int nights;
  final int unfinishedTasks;
  final List<String> avatars;

  ItemModel({
    required this.title,
    required this.imageUrl,
    required this.dateRange,
    required this.nights,
    required this.unfinishedTasks,
    required this.avatars,
  });
}
