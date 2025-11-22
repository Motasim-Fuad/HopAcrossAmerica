class EvenadminShopModel {
  final String id;
  final String name;
  final String email;
  final String location;
  final String logo;
  final String about;
  final String contactPersonName;
  final String contactNumber;
  final String coverImage;
  final DateTime createdAt;

  EvenadminShopModel({
    required this.id,
    required this.name,
    required this.email,
    required this.location,
    required this.logo,
    required this.about,
    required this.contactPersonName,
    required this.contactNumber,
    required this.coverImage,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'location': location,
      'logo': logo,
      'about': about,
      'contactPersonName': contactPersonName,
      'contactNumber': contactNumber,
      'coverImage': coverImage,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory EvenadminShopModel.fromJson(Map<String, dynamic> json) {
    return EvenadminShopModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      location: json['location'],
      logo: json['logo'],
      about: json['about'],
      contactPersonName: json['contactPersonName'],
      contactNumber: json['contactNumber'],
      coverImage: json['coverImage'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}