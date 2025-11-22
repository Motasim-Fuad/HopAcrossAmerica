class EventAdminDigitalPassportModel {
  final String id;
  final String eventName;
  final String eventDescription;
  final String eventLogo;
  final String fillAmount; // e.g., "357 Fill = $2"
  final String instructions;
  final List<String> shopIds; // Store shop IDs
  final String fromDate;
  final String toDate;
  final DateTime createdAt;
  final DateTime? updatedAt;

  EventAdminDigitalPassportModel({
    required this.id,
    required this.eventName,
    required this.eventDescription,
    required this.eventLogo,
    required this.fillAmount,
    required this.instructions,
    required this.shopIds,
    required this.fromDate,
    required this.toDate,
    required this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'eventName': eventName,
      'eventDescription': eventDescription,
      'eventLogo': eventLogo,
      'fillAmount': fillAmount,
      'instructions': instructions,
      'shopIds': shopIds,
      'fromDate': fromDate,
      'toDate': toDate,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  factory EventAdminDigitalPassportModel.fromJson(Map<String, dynamic> json) {
    return EventAdminDigitalPassportModel(
      id: json['id'],
      eventName: json['eventName'],
      eventDescription: json['eventDescription'],
      eventLogo: json['eventLogo'],
      fillAmount: json['fillAmount'],
      instructions: json['instructions'],
      shopIds: List<String>.from(json['shopIds']),
      fromDate: json['fromDate'],
      toDate: json['toDate'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  EventAdminDigitalPassportModel copyWith({
    String? id,
    String? eventName,
    String? eventDescription,
    String? eventLogo,
    String? fillAmount,
    String? instructions,
    List<String>? shopIds,
    String? fromDate,
    String? toDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return EventAdminDigitalPassportModel(
      id: id ?? this.id,
      eventName: eventName ?? this.eventName,
      eventDescription: eventDescription ?? this.eventDescription,
      eventLogo: eventLogo ?? this.eventLogo,
      fillAmount: fillAmount ?? this.fillAmount,
      instructions: instructions ?? this.instructions,
      shopIds: shopIds ?? this.shopIds,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}