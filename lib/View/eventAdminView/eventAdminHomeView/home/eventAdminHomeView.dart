import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Resource/App_Routes/routes_name.dart';
import 'package:hopacrossamerica/Resource/Colors/app_colors.dart';
import 'package:hopacrossamerica/View/eventAdminView/eventAdminHomeView/home/widgets/event_card_widgets.dart';
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminHomeController/eventAdminhome_controller.dart';

class Eventadminhomeview extends GetView<EventadminhomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgrountColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'My Events',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () async {
              await Get.toNamed(RouteName.eventAdmin_createEventView);
              controller.loadEvents();
            },
            icon: const Icon(Icons.add, color: Colors.blue, size: 20),
            label: const Text(
              'Create new event',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.events.isEmpty) {
          return _buildEmptyState(context);
        }

        return _buildEventsList();
      }),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          const Text(
          'My Events',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          "You haven't created any events yet",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 8),
      const Text(
        'Tap the \'Create Event\' button below to add a new event once approved, your events will appear here.',
        style: TextStyle(
          fontSize: 13,
          color: Colors.black54,
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 32),
      Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(Icons.add, size: 32),
          onPressed: () async {
            await Get.toNamed(RouteName.eventAdmin_createEventView);
            controller.loadEvents();
          },
        ),
      ),
      const SizedBox(height: 12),
      const Text(
        'Create New Event',
        style: TextStyle(
          fontSize: 14,
          color: Colors.black54,
        ),
      ),
      ],
    ),
    ),
    );
  }

  Widget _buildEventsList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: controller.events.length,
      itemBuilder: (context, index) {
        return EventCardWidget(
          event: controller.events[index],
          onDelete: () => controller.deleteEvent(controller.events[index].id),
        );
      },
    );
  }
}