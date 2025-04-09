import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> saveCategoryItems() async {
  final CollectionReference ref = FirebaseFirestore.instance.collection(
    'AppCategories',
  );
  for (final category in categoryList) {
    final String id =
        DateTime.now().toIso8601String() + Random().nextInt(1000).toString();
    ref.doc("das");
    await ref.doc(id).set(category.toMap());
  }
}

class Category {
  final String title;
  final String image;
  Category({required this.title, required this.image});
  Map<String, dynamic> toMap() {
    return {'title': title, 'image': image};
  }
}

final List<Category> categoryList = [
  Category(
    title: 'Dummy',
    image:
        'https://i.pinimg.com/474x/8f/47/e7/8f47e7a93e0177cde976eff34cb49d1e.jpg',
  ),
  Category(
    title: 'Dummy',
    image:
        'https://i.pinimg.com/474x/8f/47/e7/8f47e7a93e0177cde976eff34cb49d1e.jpg',
  ),
  Category(
    title: 'Dummy',
    image:
        'https://i.pinimg.com/474x/8f/47/e7/8f47e7a93e0177cde976eff34cb49d1e.jpg',
  ),
  Category(
    title: 'Dummy',
    image:
        'https://i.pinimg.com/474x/8f/47/e7/8f47e7a93e0177cde976eff34cb49d1e.jpg',
  ),
];
