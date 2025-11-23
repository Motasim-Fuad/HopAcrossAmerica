// views/event_list_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Resource/Colors/app_colors.dart';
import 'package:hopacrossamerica/View/eventAdminView/eventAdminRequestsView/widgets/eventCard.dart' show EventCard;
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminRequestsController/request_event_list_controller.dart';

class EventadminrequestsEventListView extends StatelessWidget {
  const EventadminrequestsEventListView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RequestEventListController());

    return Scaffold(
      backgroundColor: AppColor.backgrountColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Requests',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: controller.events.length,
          itemBuilder: (context, index) {
            final event = controller.events[index];
            return EventCard(
              event: event,
              onTap: () => controller.onEventTap(event),
            );
          },
        );
      }),
    );
  }
}