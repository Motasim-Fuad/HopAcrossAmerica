import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Model/eventAdminModel/eventAdminHomeModel/evenAdmin_shop_model.dart';
import 'package:hopacrossamerica/Resource/App_Routes/routes_name.dart';
import 'package:hopacrossamerica/Resource/Colors/app_colors.dart';
import 'package:hopacrossamerica/Resource/Compunents/app_button.dart';
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminHomeController/event_admin_create_event_controller.dart';

class CreateEventView extends GetView<EventAdminCreateEventController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgrountColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Create Event',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField('Event Name', 'Enter event name', controller.nameController),
              const SizedBox(height: 20),
              _buildTextField('About the Event', 'Describe about the event...', controller.aboutController, maxLines: 3),
              const SizedBox(height: 20),
              _buildTextField('Location', 'Enter event location', controller.locationController),
              const SizedBox(height: 20),
              _buildTextField('From Date', 'Enter date', controller.fromDateController),
              const SizedBox(height: 20),
              _buildTextField('To Date', 'Enter date', controller.toDateController),
              const SizedBox(height: 20),
              _buildTextField('Contact Person Name', 'Enter person name', controller.contactPersonController),
              const SizedBox(height: 20),
              _buildTextField('Contact Number', 'Your contact number', controller.contactNumberController),
              const SizedBox(height: 20),
              _buildImageUploadSection(),
              const SizedBox(height: 24),
              _buildShopSection(context),
              const SizedBox(height: 24),
              RoundedButton(
                title: "Submit",
                onPress: () => controller.submitEvent(),
                loading: controller.isLoading.value,
                gradientColors: AppColor.primaryGradient,
                width: double.infinity,
                showLoadingText: true,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, TextEditingController textController, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: textController,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF5B7C99)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImageUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Upload Images',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Obx(() => Column(
          children: [
            ...controller.images.asMap().entries.map((entry) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.image, color: Colors.grey),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Image ${entry.key + 1}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 20),
                      onPressed: () => controller.removeImage(entry.key),
                    ),
                  ],
                ),
              );
            }).toList(),
            GestureDetector(
              onTap: () {
                controller.addImage('dummy_image_${DateTime.now().millisecondsSinceEpoch}.jpg');
              },
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  border: Border.all(color: Colors.grey[300]!, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.cloud_upload_outlined, size: 40, color: Colors.grey[400]),
                      const SizedBox(height: 8),
                      Text(
                        'Upload',
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
      ],
    );
  }

  Widget _buildShopSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Show selected shops
        Obx(() {
          if (controller.selectedShops.isEmpty) {
            return const SizedBox.shrink();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Selected Shops',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              ...controller.selectedShops.map((shop) => _buildSelectedShopTile(shop)).toList(),
              const SizedBox(height: 20),
            ],
          );
        }),

        // Suggested shops (always visible)
        Obx(() {
          if (controller.suggestedShops.isEmpty || controller.showShopSearch.value) {
            return const SizedBox.shrink();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Suggested Shops',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              ...controller.suggestedShops.map((shop) => _buildShopTile(shop)).toList(),
              const SizedBox(height: 12),
            ],
          );
        }),

        // Search section (conditionally visible)
        Obx(() {
          if (!controller.showShopSearch.value) {
            return const SizedBox.shrink();
          }
          return Column(
            children: [
              _buildShopSearchSection(),
              const SizedBox(height: 12),
            ],
          );
        }),

        // Always show search and add buttons
        _buildSearchExistingShopButton(),
        const SizedBox(height: 12),
        _buildAddNewShopButton(),
      ],
    );
  }

  Widget _buildSelectedShopTile(EvenadminShopModel shop) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF5B7C99), width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.pink[100],
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Center(
              child: Icon(Icons.storefront, color: Colors.pink, size: 20),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shop.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  shop.location,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, size: 20, color: Color(0xFF5B7C99)),
            onPressed: () => controller.editShop(shop.id),
          ),
          IconButton(
            icon: const Icon(Icons.delete, size: 20, color: Colors.red),
            onPressed: () => controller.deleteShop(shop.id),
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 20, color: Colors.grey),
            onPressed: () => controller.removeShop(shop.id),
          ),
        ],
      ),
    );
  }

  Widget _buildShopTile(EvenadminShopModel shop) {
    return GestureDetector(
      onTap: () => controller.selectShop(shop),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Center(
                child: Icon(Icons.storefront, color: Colors.pink, size: 20),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shop.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    shop.location,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.add_circle_outline, color: Color(0xFF5B7C99)),
          ],
        ),
      ),
    );
  }

  Widget _buildShopSearchSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller.searchController,
          onChanged: controller.searchShops,
          decoration: InputDecoration(
            hintText: 'Search existing shop',
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF5B7C99)),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Obx(() => Column(
          children: controller.suggestedShops.map((shop) => _buildShopTile(shop)).toList(),
        )),
      ],
    );
  }

  Widget _buildSearchExistingShopButton() {
    return Obx(() => GestureDetector(
      onTap: () => controller.showShopSearch.value = !controller.showShopSearch.value,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              controller.showShopSearch.value ? Icons.close : Icons.search,
              color: Colors.grey[600],
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              controller.showShopSearch.value ? 'Close Search' : 'Search existing shop',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _buildAddNewShopButton() {
    return GestureDetector(
      onTap: () async {
        await Get.toNamed(RouteName.eventAdmin_addShopView);
        controller.loadShops();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, color: Colors.grey[700], size: 20),
            const SizedBox(width: 8),
            Text(
              'Add New Shop',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}