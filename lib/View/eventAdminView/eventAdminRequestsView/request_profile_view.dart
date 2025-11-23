import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hopacrossamerica/Resource/Colors/app_colors.dart';
import 'package:hopacrossamerica/Resource/Compunents/app_button.dart';
import 'package:hopacrossamerica/View/eventAdminView/eventAdminRequestsView/widgets/request_profile_info_card.dart';
import 'package:hopacrossamerica/ViewModel/Controller/eventAdminController/eventAdminRequestsController/Event_Request_contoller.dart';

class RequestProfileView extends StatelessWidget {
  const RequestProfileView({super.key});

  @override
  Widget build(BuildContext context) {
     final controller = Get.put(RequestProfileController());

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
          'Profile View',
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

        final profile = controller.profile.value;
        if (profile == null) {
          return Center(child: Text('Profile not found'));
        }

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(profile.imageUrl),
                  onBackgroundImageError: (_, __) {},
                  child: profile.imageUrl.isEmpty
                      ? Icon(Icons.person, size: 60)
                      : null,
                ),
                SizedBox(height: 30),
                ProfileInfoCard(
                  label: 'Name',
                  value: profile.name,
                ),
                ProfileInfoCard(
                  label: 'Address',
                  value: profile.address,
                ),
                ProfileInfoCard(
                  label: 'Email',
                  value: profile.email,
                ),
                ProfileInfoCard(
                  label: 'Contact Number',
                  value: profile.contactNumber,
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      // child: ElevatedButton(
                      //   onPressed: controller.acceptRequest,
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Colors.green,
                      //     padding: EdgeInsets.symmetric(vertical: 16),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(8),
                      //     ),
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Icon(Icons.check, color: Colors.white),
                      //       SizedBox(width: 8),
                      //       Text(
                      //         'Accept',
                      //         style: TextStyle(
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.w600,
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      child: RoundedButton(
                          title: "Accept",
                          onPress: controller.acceptRequest,
                        loading: controller.isLoading.value,
                        showLoadingText: true,
                        gradientColors: AppColor.greenGradient,
                        iconPosition: IconPosition.left,
                        icon:Icons.check,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      // child: ElevatedButton(
                      //   onPressed: controller.rejectRequest,
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Colors.red,
                      //     padding: EdgeInsets.symmetric(vertical: 16),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(8),
                      //     ),
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Icon(Icons.close, color: Colors.white),
                      //       SizedBox(width: 8),
                      //       Text(
                      //         'Reject',
                      //         style: TextStyle(
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.w600,
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      child: RoundedButton(
                        title: "Reject",
                        onPress: controller.rejectRequest,
                        loading: controller.isLoading.value,
                        showLoadingText: true,
                        gradientColors: AppColor.readGradient,
                        iconPosition: IconPosition.left,
                        icon:Icons.close,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}