import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Resource/Colors/app_colors.dart';
import 'package:hopacrossamerica/View/eventAdminView/eventAdminRequestsView/widgets/requestCard.dart' show RequestCard;
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminRequestsController/Event_Request_contoller.dart';

class EventRequestsView extends StatelessWidget {
  const EventRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EventRequestsController());

    return Scaffold(
      backgroundColor: AppColor.backgrountColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Event Requests',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: controller.requests.length,
          itemBuilder: (context, index) {
            final request = controller.requests[index];
            return RequestCard(
              request: request,
              onTap: () => controller.onRequestTap(request),
            );
          },
        );
      }),
    );
  }
}
