import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Model/eventAdminModel/eventAdminHomeModel/evenAdmin_shop_model.dart';
import 'package:hopacrossamerica/Resource/Colors/app_colors.dart';
import 'package:hopacrossamerica/Resource/Compunents/app_button.dart';
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminDigitalPassController/eventAdmin_digital_passport_shop_controller.dart';

class EventAdminDigitalPassportShopView extends GetView<EventAdminDigitalPassportShopController> {
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
          'Add Shops',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.allShops.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Selected shops section
                    if (controller.selectedShops.isNotEmpty) ...[
                      _buildShopGrid(controller.selectedShops, isSelected: true),
                      const SizedBox(height: 20),
                    ],

                    // Available shops section
                    if (controller.allShops.isNotEmpty) ...[
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Available Shops',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildShopGrid(
                        controller.allShops.where((shop) =>
                        !controller.selectedShops.any((s) => s.id == shop.id)
                        ).toList(),
                        isSelected: false,
                      ),
                    ],

                    const SizedBox(height: 20),

                    // Add new shop button
                    _buildAddNewShopButton(),
                  ],
                ),
              ),
            ),

            // Bottom buttons
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RoundedButton(
                    title: controller.isEditMode ? "Update" : "Create",
                    onPress: () => controller.createOrUpdatePassport(),
                    loading: controller.isLoading.value,
                    gradientColors: AppColor.primaryGradient,
                    width: double.infinity,
                    showLoadingText: true,
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: () => controller.seePreview(),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF5B7C99)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.visibility_outlined, color: Color(0xFF5B7C99), size: 20),
                        SizedBox(width: 8),
                        Text(
                          'See Preview',
                          style: TextStyle(
                            color: Color(0xFF5B7C99),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildShopGrid(List<EvenadminShopModel> shops, {required bool isSelected}) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemCount: shops.length,
      itemBuilder: (context, index) {
        final shop = shops[index];
        return _buildShopCard(shop, isSelected: isSelected);
      },
    );
  }

  Widget _buildShopCard(EvenadminShopModel shop, {required bool isSelected}) {
    return GestureDetector(
      onTap: () {
        if (isSelected) {
          controller.removeShop(shop.id);
        } else {
          controller.addShop(shop);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF5B7C99) : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: shop.logo.isEmpty
                      ? Icon(Icons.store, color: Colors.grey[400], size: 24)
                      : ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      shop.logo,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.store, color: Colors.grey[400], size: 24);
                      },
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF5B7C99) : Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isSelected ? Icons.check : Icons.add,
                    color: isSelected ? Colors.white : Colors.grey[600],
                    size: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              shop.name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.location_on, size: 12, color: Colors.grey[500]),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    shop.location,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                Icon(Icons.phone, size: 12, color: Colors.grey[500]),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    shop.contactNumber,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddNewShopButton() {
    return GestureDetector(
      onTap: () => controller.createNewShop(),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF5B7C99), width: 1.5, style: BorderStyle.solid),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.add_circle_outline, color: Color(0xFF5B7C99), size: 24),
            SizedBox(width: 8),
            Text(
              'Add New Shop',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF5B7C99),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
