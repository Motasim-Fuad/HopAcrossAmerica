class Shop {
  final String id;
  final String name;
  final String description;
  final String image;
  final double rating;
  final String address;

  Shop({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.rating,
    required this.address,
  });
}

class Event {
  final String id;
  final String title;
  final String date;
  final String location;
  final String description;
  final String image;

  Event({
    required this.id,
    required this.title,
    required this.date,
    required this.location,
    required this.description,
    required this.image,
  });
}

class UserProfile {
  String name;
  String email;
  String phone;
  String address;
  String image;

  UserProfile({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    this.image = '',
  });
}