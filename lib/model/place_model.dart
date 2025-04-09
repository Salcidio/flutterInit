
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> savePlacesToFirebase() async {
  final CollectionReference ref = FirebaseFirestore.instance.collection(
    'MyAppCollection',
  );
  for (final Place place in listOfPlaces) {
    final String id =
        DateTime.now().toIso8601String() + Random().nextInt(1000).toString();
    ref.doc("das");
    await ref.doc(id).set(place.toMap());
  }
}

class Place {
  final String title;
  bool isActive;
  final String image;
  final double rating;
  final String date;
  final int price;
  final String address;
  final String vendor;
  final String vendorProfession;
  final int review;
  final String bedAndBathroom;
  final int yearOfHosting;
  final String vendorProfile;
  final double latitude;
  final double longitude;
  final List<String> imageUrl;

  Place({
    required this.title,
    required this.isActive,
    required this.image,
    required this.rating,
    required this.date,
    required this.price,
    required this.address,
    required this.vendor,
    required this.vendorProfession,
    required this.review,
    required this.bedAndBathroom,
    required this.yearOfHosting,
    required this.vendorProfile,
    required this.latitude,
    required this.longitude,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isActive': isActive,
      'image': image,
      'rating': rating,
      'date': date,
      'price': price,
      'address': address,
      'vendor': vendor,
      'vendorProfession': vendorProfession,
      'review': review,
      'bedAndBathroom': bedAndBathroom,
      'yearOfHosting': yearOfHosting,
      'vendorProfile': vendorProfile,
      'latitude': latitude,
      'longitude': longitude,
      'imageUrl': imageUrl,
    };
  }
}

final List<Place> listOfPlaces = [
  Place(
    title: 'Example Property',
    isActive: true,
    image:
        'https://i.pinimg.com/474x/8f/47/e7/8f47e7a93e0177cde976eff34cb49d1e.jpg',
    rating: 4.5,
    date: '2023-01-01',
    price: 1000,
    address: '123 Main St',
    vendor: 'John Doe',
    vendorProfession: 'Real Estate Agent',
    review: 50,
    bedAndBathroom: '3 Beds, 2 Baths',
    yearOfHosting: 5,
    vendorProfile:
        'https://i.pinimg.com/474x/75/03/43/75034340740e9d99833d59365cdf4fba.jpg',
    latitude: 37.7749,
    longitude: -122.4194,
    imageUrl: [
      'https://i.pinimg.com/236x/53/87/a2/5387a2a69470ed5ba2dc8b2222b2511f.jpg',
      'https://i.pinimg.com/236x/53/87/a2/5387a2a69470ed5ba2dc8b2222b2511f.jpg',
      'https://i.pinimg.com/236x/53/87/a2/5387a2a69470ed5ba2dc8b2222b2511f.jpg',
      'https://i.pinimg.com/236x/53/87/a2/5387a2a69470ed5ba2dc8b2222b2511f.jpg',
      
    ],
  ),

   Place(
    title: 'Example Property',
    isActive: true,
    image:
        'https://i.pinimg.com/474x/8f/47/e7/8f47e7a93e0177cde976eff34cb49d1e.jpg',
    rating: 4.5,
    date: '2023-01-01',
    price: 1000,
    address: '123 Main St',
    vendor: 'John Doe',
    vendorProfession: 'Real Estate Agent',
    review: 50,
    bedAndBathroom: '3 Beds, 2 Baths',
    yearOfHosting: 5,
    vendorProfile:
        'https://i.pinimg.com/474x/75/03/43/75034340740e9d99833d59365cdf4fba.jpg',
    latitude: 37.7749,
    longitude: -122.4194,
    imageUrl: [
      'https://i.pinimg.com/236x/53/87/a2/5387a2a69470ed5ba2dc8b2222b2511f.jpg',
      'https://i.pinimg.com/236x/53/87/a2/5387a2a69470ed5ba2dc8b2222b2511f.jpg',
      'https://i.pinimg.com/236x/53/87/a2/5387a2a69470ed5ba2dc8b2222b2511f.jpg',
      'https://i.pinimg.com/236x/53/87/a2/5387a2a69470ed5ba2dc8b2222b2511f.jpg',
      
    ],
  ),

   Place(
    title: 'Example Property',
    isActive: true,
    image:
        'https://i.pinimg.com/474x/8f/47/e7/8f47e7a93e0177cde976eff34cb49d1e.jpg',
    rating: 4.5,
    date: '2023-01-01',
    price: 1000,
    address: '123 Main St',
    vendor: 'John Doe',
    vendorProfession: 'Real Estate Agent',
    review: 50,
    bedAndBathroom: '3 Beds, 2 Baths',
    yearOfHosting: 5,
    vendorProfile:
        'https://i.pinimg.com/474x/75/03/43/75034340740e9d99833d59365cdf4fba.jpg',
    latitude: 37.7749,
    longitude: -122.4194,
    imageUrl: [
      'https://i.pinimg.com/236x/53/87/a2/5387a2a69470ed5ba2dc8b2222b2511f.jpg',
      'https://i.pinimg.com/236x/53/87/a2/5387a2a69470ed5ba2dc8b2222b2511f.jpg',
      'https://i.pinimg.com/236x/53/87/a2/5387a2a69470ed5ba2dc8b2222b2511f.jpg',
      'https://i.pinimg.com/236x/53/87/a2/5387a2a69470ed5ba2dc8b2222b2511f.jpg',
      
    ],
  ),

   Place(
    title: 'Example Property',
    isActive: true,
    image:
        'https://i.pinimg.com/474x/8f/47/e7/8f47e7a93e0177cde976eff34cb49d1e.jpg',
    rating: 4.5,
    date: '2023-01-01',
    price: 1000,
    address: '123 Main St',
    vendor: 'John Doe',
    vendorProfession: 'Real Estate Agent',
    review: 50,
    bedAndBathroom: '3 Beds, 2 Baths',
    yearOfHosting: 5,
    vendorProfile:
        'https://i.pinimg.com/474x/75/03/43/75034340740e9d99833d59365cdf4fba.jpg',
    latitude: 37.7749,
    longitude: -122.4194,
    imageUrl: [
      'https://i.pinimg.com/236x/53/87/a2/5387a2a69470ed5ba2dc8b2222b2511f.jpg',
      'https://i.pinimg.com/236x/53/87/a2/5387a2a69470ed5ba2dc8b2222b2511f.jpg',
      'https://i.pinimg.com/236x/53/87/a2/5387a2a69470ed5ba2dc8b2222b2511f.jpg',
      'https://i.pinimg.com/236x/53/87/a2/5387a2a69470ed5ba2dc8b2222b2511f.jpg',
      
    ],
  ),
];
