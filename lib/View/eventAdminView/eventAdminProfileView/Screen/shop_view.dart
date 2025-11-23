import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Resource/App_Routes/routes_name.dart';
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminProfileController/ShopsViewModel.dart';

class ShopsView extends GetView<ShopsViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shops'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () => Get.toNamed(RouteName.profile),
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              onChanged: controller.search,
              decoration: InputDecoration(
                hintText: 'Search shops...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: controller.filteredShops.length,
              itemBuilder: (context, index) {
                final shop = controller.filteredShops[index];
                return Card(
                  margin: EdgeInsets.only(bottom: 16),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          shop.image,
                          style: TextStyle(fontSize: 32),
                        ),
                      ),
                    ),
                    title: Text(
                      shop.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4),
                        Text(shop.description),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            SizedBox(width: 4),
                            Text('${shop.rating}'),
                            SizedBox(width: 12),
                            Icon(Icons.location_on, color: Colors.red, size: 16),
                            SizedBox(width: 4),
                            Expanded(child: Text(shop.address, overflow: TextOverflow.ellipsis)),
                          ],
                        ),
                      ],
                    ),
                    onTap: () {
                      Get.snackbar('Shop', 'Selected: ${shop.name}');
                    },
                  ),
                );
              },
            )),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.redAccent],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.red),
                ),
                SizedBox(height: 10),
                Text(
                  'Lekha Stigner',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'lekha@example.com',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.store),
            title: Text('Shops'),
            onTap: () {
              Get.back();
              Get.toNamed(RouteName.shops);
            },
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text('Events'),
            onTap: () {
              Get.back();
              Get.toNamed(RouteName.events);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Get.back();
              Get.toNamed(RouteName.profile);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Get.back();
              Get.toNamed(RouteName.settings);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              Get.back();
              Get.toNamed(RouteName.about);
            },
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Privacy Policy'),
            onTap: () {
              Get.back();
              Get.toNamed(RouteName.privacy);
            },
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Terms & Conditions'),
            onTap: () {
              Get.back();
              Get.toNamed(RouteName.terms);
            },
          ),
        ],
      ),
    );
  }
}
