import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/View/shopperView/%20shopperDigitalPassView/shopperDigitalPassView.dart';
import 'package:hopacrossamerica/View/shopperView/shopperHomeView/shopperHomeView.dart';
import 'package:hopacrossamerica/View/shopperView/shopperProfileView/shopperProfileView.dart';
import '../../../ViewModel/Controller/shopperController/shopperBtmNavController.dart';

class ShopperBtmNavView extends StatelessWidget {
  final ShopperBtmNavController controller = Get.put(ShopperBtmNavController());

  final List<Widget> pages = [
    Shopperhomeview(),
    Shopperdigitalpassview(),
    Shopperprofileview()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.selectedIndex.value]),

      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        onTap: (i) => controller.selectedIndex.value = i,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.card_membership_outlined), label: "Digital Pass"),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: "Profile"),
        ],
      )),
    );
  }
}

