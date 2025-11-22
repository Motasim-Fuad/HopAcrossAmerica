import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Model/eventAdminModel/eventAdmin_digitalPassportModel/event_adimin_digital_passport_model.dart';
import 'package:hopacrossamerica/Resource/Colors/app_colors.dart';
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminDigitalPassController/eventAdmin_digital_passport_list_controller.dart';

class EventAdminDigitalPassportListView extends GetView<EventAdminDigitalPassportListController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgrountColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Digital passport',
          style: TextStyle(
            color: Color(0xFF5B7C99),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.passports.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.article_outlined, size: 80, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  Text(
                    'No digital passports yet',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 24),
                  _buildCreateButton(),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.passports.length,
                  itemBuilder: (context, index) {
                    final passport = controller.passports[index];
                    return _buildPassportCard(passport);
                  },
                ),
              ),
              const SizedBox(height: 16),
              _buildCreateButton(),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildPassportCard(EventAdminDigitalPassportModel passport) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: passport.eventLogo.isEmpty
                ? Icon(Icons.event, color: Colors.grey[400], size: 30)
                : ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                passport.eventLogo,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.event, color: Colors.grey[400], size: 30);
                },
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              passport.eventName,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () => controller.viewPassport(passport.id),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF5B7C99)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: const [
                  Icon(Icons.visibility_outlined, size: 16, color: Color(0xFF5B7C99)),
                  SizedBox(width: 6),
                  Text(
                    'View',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF5B7C99),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreateButton() {
    return InkWell(
      onTap: () => controller.createNewPassport(),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF5B7C99), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.event, color: Colors.grey[400], size: 30),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'Create New Passport',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF5B7C99),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: const [
                  Icon(Icons.add, size: 16, color: Colors.white),
                  SizedBox(width: 4),
                  Text(
                    'Create passport',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
