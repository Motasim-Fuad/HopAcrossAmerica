class Eventadmin_EventModel {
  final String id;
  final String name;
  final String about;
  final String location;
  final String fromDate;
  final String toDate;
  final String contactPersonName;
  final String contactNumber;
  final List<String> images;
  final String? shopId;
  final DateTime createdAt;

  Eventadmin_EventModel({
    required this.id,
    required this.name,
    required this.about,
    required this.location,
    required this.fromDate,
    required this.toDate,
    required this.contactPersonName,
    required this.contactNumber,
    required this.images,
    this.shopId,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'about': about,
      'location': location,
      'fromDate': fromDate,
      'toDate': toDate,
      'contactPersonName': contactPersonName,
      'contactNumber': contactNumber,
      'images': images,
      'shopId': shopId,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Eventadmin_EventModel.fromJson(Map<String, dynamic> json) {
    return Eventadmin_EventModel(
      id: json['id'],
      name: json['name'],
      about: json['about'],
      location: json['location'],
      fromDate: json['fromDate'],
      toDate: json['toDate'],
      contactPersonName: json['contactPersonName'],
      contactNumber: json['contactNumber'],
      images: List<String>.from(json['images']),
      shopId: json['shopId'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
