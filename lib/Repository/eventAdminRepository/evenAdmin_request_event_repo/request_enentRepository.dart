// repositories/event_repository.dart
import 'package:hopacrossamerica/Model/eventAdminModel/event_admin%20_Requests/request_even_model.dart';

class RequestEnentrepository {
  // API calls er jonno - egula tomar backend API te connect korbe

  Future<List<RequestEvenModel>> fetchEvents() async {
    // Dummy data - tomar API call diye replace korbe
    await Future.delayed(Duration(seconds: 1));
    return [
      RequestEvenModel(
        id: '1',
        name: 'Hop',
        shopName: 'The Great Shop',
        imageUrl: 'https://via.placeholder.com/150',
        requestCount: 3,
      ),
      RequestEvenModel(
        id: '2',
        name: 'Summer Party',
        shopName: 'The Great Shop',
        imageUrl: 'https://via.placeholder.com/150',
        requestCount: 5,
      ),
    ];
  }

  Future<List<RequestModel>> fetchEventRequests(String eventId) async {
    await Future.delayed(Duration(milliseconds: 500));
    return [
      RequestModel(
        id: '1',
        eventId: eventId,
        userName: 'Lukas Wagner',
        userImage: 'https://via.placeholder.com/150',
        status: 'pending',
      ),
      RequestModel(
        id: '2',
        eventId: eventId,
        userName: 'Lukas Wagner',
        userImage: 'https://via.placeholder.com/150',
        status: 'pending',
      ),
      RequestModel(
        id: '3',
        eventId: eventId,
        userName: 'Lukas Wagner',
        userImage: 'https://via.placeholder.com/150',
        status: 'pending',
      ),
    ];
  }

  Future<ProfileModel> fetchProfile(String requestId) async {
    await Future.delayed(Duration(milliseconds: 500));
    return ProfileModel(
      id: requestId,
      name: 'Sunan Rahman',
      address: '142 W. Maple Street',
      email: '@gmail.com',
      contactNumber: '405-783-2145',
      imageUrl: 'https://via.placeholder.com/150',
    );
  }

  Future<bool> acceptRequest(String requestId) async {
    await Future.delayed(Duration(milliseconds: 500));
    return true;
  }

  Future<bool> rejectRequest(String requestId) async {
    await Future.delayed(Duration(milliseconds: 500));
    return true;
  }
}



