class RequestEvenModel {
  final String id;
  final String name;
  final String shopName;
  final String imageUrl;
  final int requestCount;

  RequestEvenModel({
    required this.id,
    required this.name,
    required this.shopName,
    required this.imageUrl,
    required this.requestCount,
  });

  factory RequestEvenModel.fromJson(Map<String, dynamic> json) {
    return RequestEvenModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      shopName: json['shopName'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      requestCount: json['requestCount'] ?? 0,
    );
  }
}

// models/request_model.dart
class RequestModel {
  final String id;
  final String eventId;
  final String userName;
  final String userImage;
  final String status; // pending, accepted, rejected

  RequestModel({
    required this.id,
    required this.eventId,
    required this.userName,
    required this.userImage,
    required this.status,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      id: json['id'] ?? '',
      eventId: json['eventId'] ?? '',
      userName: json['userName'] ?? '',
      userImage: json['userImage'] ?? '',
      status: json['status'] ?? 'pending',
    );
  }
}

// models/profile_model.dart
class ProfileModel {
  final String id;
  final String name;
  final String address;
  final String email;
  final String contactNumber;
  final String imageUrl;

  ProfileModel({
    required this.id,
    required this.name,
    required this.address,
    required this.email,
    required this.contactNumber,
    required this.imageUrl,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      email: json['email'] ?? '',
      contactNumber: json['contactNumber'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}
