import 'package:flutter/material.dart';
import 'package:hopacrossamerica/Resource/Colors/app_colors.dart';

class Eventadminqrview extends StatefulWidget {
  const Eventadminqrview({super.key});

  @override
  State<Eventadminqrview> createState() => _EventadminqrviewState();
}

class _EventadminqrviewState extends State<Eventadminqrview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgrountColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'QR Scanner',
          style: TextStyle(
            color: Color(0xFF5B7C99),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Text("Event Admin QR View"),
      ),
    );
  }
}
