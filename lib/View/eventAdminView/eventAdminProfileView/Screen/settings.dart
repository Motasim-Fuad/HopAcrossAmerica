import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Resource/App_Routes/routes_name.dart';
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminProfileController/SettingsViewModel.dart';

class SettingsView extends GetView<SettingsViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.lock, color: Colors.red),
                  title: Text('Change Password'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: controller.changePassword,
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.notifications, color: Colors.red),
                  title: Text('Notifications'),
                  trailing: Switch(
                    value: true,
                    onChanged: (val) {},
                    activeColor: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.info, color: Colors.blue),
                  title: Text('About'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => Get.toNamed(RouteName.about),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.privacy_tip, color: Colors.orange),
                  title: Text('Privacy Policy'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => Get.toNamed(RouteName.privacy),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.description, color: Colors.green),
                  title: Text('Terms & Conditions'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => Get.toNamed(RouteName.terms),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              Get.defaultDialog(
                title: 'Logout',
                middleText: 'Are you sure you want to logout?',
                textConfirm: 'Yes',
                textCancel: 'No',
                confirmTextColor: Colors.white,
                onConfirm: () {
                  Get.back();
                  Get.snackbar('Success', 'Logged out successfully');
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text('Logout', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}