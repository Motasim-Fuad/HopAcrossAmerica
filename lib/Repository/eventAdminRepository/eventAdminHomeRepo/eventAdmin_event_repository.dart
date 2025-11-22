import 'package:get_storage/get_storage.dart';
import 'package:hopacrossamerica/Model/eventAdminModel/eventAdminHomeModel/evenAdmin_event_model.dart';

class EventadminEventRepository {
  final GetStorage _storage = GetStorage();
  static const String _eventsKey = 'events';

  Future<List<Eventadmin_EventModel>> getAllEvents() async {
    final eventsJson = _storage.read<List>(_eventsKey);
    if (eventsJson == null) return [];
    return eventsJson.map((e) => Eventadmin_EventModel.fromJson(e)).toList();
  }

  Future<void> saveEvent(Eventadmin_EventModel event) async {
    final events = await getAllEvents();
    events.add(event);
    await _storage.write(_eventsKey, events.map((e) => e.toJson()).toList());
  }

  Future<void> updateEvent(Eventadmin_EventModel event) async {
    final events = await getAllEvents();
    final index = events.indexWhere((e) => e.id == event.id);
    if (index != -1) {
      events[index] = event;
      await _storage.write(_eventsKey, events.map((e) => e.toJson()).toList());
    }
  }

  Future<void> deleteEvent(String eventId) async {
    final events = await getAllEvents();
    events.removeWhere((e) => e.id == eventId);
    await _storage.write(_eventsKey, events.map((e) => e.toJson()).toList());
  }
}