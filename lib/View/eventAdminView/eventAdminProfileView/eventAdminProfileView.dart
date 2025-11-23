import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Resource/App_Routes/routes_name.dart';
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminProfileController/ProfileViewModel.dart';
import 'package:image_picker/image_picker.dart';
class Eventadminprofileview extends GetView<ProfileViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Obx(() {
          final user = controller.profile.value;
          if (user == null) return Center(child: CircularProgressIndicator());

          return Column(
            children: [
              // Header with 3 colors background
              Container(
                height: 200,
                child: Stack(
                  children: [
                    // Three color background
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFE57373),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Color(0xFF7986CB),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF90CAF9),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Profile text and settings icon
                    Positioned(
                      top: 16,
                      left: 16,
                      right: 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.settings, color: Colors.white),
                              onPressed: () => Get.toNamed(RouteName.settings),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Profile Image
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: GestureDetector(
                          onTap: controller.pickImage,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 4),
                            ),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey[300],
                              backgroundImage: controller.imageFile.value != null
                                  ? FileImage(controller.imageFile.value!)
                                  : null,
                              child: controller.imageFile.value == null
                                  ? Icon(Icons.person, size: 50, color: Colors.grey[600])
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Name
              Text(
                user.name,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 24),
              // Menu Items
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      _buildMenuItem(
                        icon: Icons.edit,
                        title: 'Edit Profile Details',
                        onTap: () => Get.toNamed(RouteName.editProfile),
                      ),
                      SizedBox(height: 8),
                      _buildMenuItem(
                        icon: Icons.store,
                        title: 'Shops',
                        onTap: () => Get.toNamed(RouteName.shops),
                      ),
                      SizedBox(height: 8),
                      _buildMenuItem(
                        icon: Icons.event,
                        title: 'Events',
                        onTap: () => Get.toNamed(RouteName.events),
                      ),
                      SizedBox(height: 8),
                      _buildMenuItem(
                        icon: Icons.info_outline,
                        title: 'About Us',
                        onTap: () => Get.toNamed(RouteName.about),
                      ),
                      SizedBox(height: 8),
                      _buildMenuItem(
                        icon: Icons.privacy_tip_outlined,
                        title: 'Privacy Policy',
                        onTap: () => Get.toNamed(RouteName.privacy),
                      ),
                      SizedBox(height: 8),
                      _buildMenuItem(
                        icon: Icons.description_outlined,
                        title: 'Terms & Conditions',
                        onTap: () => Get.toNamed(RouteName.terms),
                      ),
                      SizedBox(height: 24),
                      // Logout Button
                      Container(
                        width: 150,
                        child: OutlinedButton(
                          onPressed: () {
                            Get.defaultDialog(
                              title: 'Logout',
                              middleText: 'Are you sure you want to logout?',
                              textConfirm: 'Yes',
                              textCancel: 'No',
                              confirmTextColor: Colors.white,
                              buttonColor: Colors.red,
                              onConfirm: () {
                                Get.back();
                                Get.snackbar('Success', 'Logged out successfully');
                              },
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.red, width: 1.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.logout, color: Colors.red, size: 20),
                              SizedBox(width: 8),
                              Text(
                                'Log out',
                                style: TextStyle(color: Colors.red, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      // Bottom Navigation Bar
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(0, -2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildNavItem(Icons.home_outlined, 'Home', false),
                            _buildNavItem(Icons.receipt_outlined, 'Digital pass', false),
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.qr_code_scanner, color: Colors.white),
                            ),
                            _buildNavItem(Icons.list_alt, 'Requests', false),
                            _buildNavItem(Icons.person_outline, 'Profile', true),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black87),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black87,
          ),
        ),
        trailing: Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive ? Colors.blue : Colors.grey,
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: isActive ? Colors.blue : Colors.grey,
          ),
        ),
      ],
    );
  }
}
