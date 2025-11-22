import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/View/eventAdminView/eventAdminDigitalPassView/eventAdmin_digital_passport_list_view.dart';
import 'package:hopacrossamerica/View/eventAdminView/eventAdminHomeView/home/eventAdminHomeView.dart';
import 'package:hopacrossamerica/View/eventAdminView/eventAdminProfileView/eventAdminProfileView.dart';
import 'package:hopacrossamerica/View/eventAdminView/eventAdminQRView/eventAdminQRView.dart';
import 'package:hopacrossamerica/View/eventAdminView/eventAdminRequestsView/eventAdminRequestsView.dart';
import '../../../ViewModel/Controller/eventAdminController/eventAdminBtmNavController.dart';

class Eventadminbtmnavview extends StatelessWidget {
  final EventAdminBtmNavController controller =
  Get.put(EventAdminBtmNavController());

  final List<Widget> pages = [
    Eventadminhomeview(),
    EventAdminDigitalPassportListView(),
    Eventadminqrview(),
    Eventadminrequestsview(),
    Eventadminprofileview(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Obx(() => pages[controller.selectedIndex.value]),

      bottomNavigationBar: Obx(() => Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 10,
                  offset: Offset(0, -3),
                ),
              ],
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                navItem(
                  index: 0,
                  icon: Icons.home_outlined,
                  label: "Home",
                ),

                navItem(
                  index: 1,
                  icon: Icons.card_membership_outlined,
                  label: "Digital pass.",
                ),

                const SizedBox(width: 60),  // space for floating QR button

                navItem(
                  index: 3,
                  icon: Icons.request_page_outlined,
                  label: "Requests",
                ),

                navItem(
                  index: 4,
                  icon: Icons.person_2_outlined,
                  label: "Profile",
                ),
              ],
            ),
          ),

          /// FLOATING QR BUTTON
          Positioned(
            top: -25,   // <-- pushes it upward like your image
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => controller.changePage(2),
              child: Center(
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.selectedIndex.value == 2
                        ? Colors.blueGrey.shade700
                        : Colors.grey.shade300,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.qr_code_scanner,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      )),

    );
  }

  /// CUSTOM NAV ITEM (for non-center items)
  Widget navItem({required int index, required IconData icon, required String label}) {
    return GestureDetector(
      onTap: () => controller.changePage(index),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 26,
            color: index == controller.selectedIndex.value
                ? Colors.blueGrey.shade700
                : Colors.grey.shade700,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: index == controller.selectedIndex.value
                  ? FontWeight.bold
                  : FontWeight.normal,
              color: index == controller.selectedIndex.value
                  ? Colors.blueGrey.shade700
                  : Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
