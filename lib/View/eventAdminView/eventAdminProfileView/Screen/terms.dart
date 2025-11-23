import 'package:flutter/material.dart';

class TermsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms & Conditions'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms & Conditions',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Last updated: November 2024',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 24),
            _buildSection(
              '1. Acceptance of Terms',
              'By accessing and using this food delivery platform, you accept and agree to be bound by the terms and provisions of this agreement.',
            ),
            _buildSection(
              '2. User Account',
              'You are responsible for maintaining the confidentiality of your account and password. You agree to accept responsibility for all activities that occur under your account.',
            ),
            _buildSection(
              '3. Orders and Payment',
              'All orders are subject to acceptance and availability. Prices are subject to change without notice. Payment must be made through our approved payment methods.',
            ),
            _buildSection(
              '4. Delivery',
              'We strive to deliver your orders within the estimated time. However, delivery times may vary due to factors beyond our control. We are not responsible for delays caused by incorrect addresses.',
            ),
            _buildSection(
              '5. Cancellation and Refunds',
              'Orders can be cancelled within 5 minutes of placement. Refunds will be processed according to our refund policy. We reserve the right to refuse refunds in cases of abuse.',
            ),
            _buildSection(
              '6. User Conduct',
              'You agree not to use the platform for any unlawful purpose or in any way that could damage, disable, or impair the platform. Abusive behavior towards delivery partners or restaurant staff will result in account suspension.',
            ),
            _buildSection(
              '7. Intellectual Property',
              'All content on this platform, including text, graphics, logos, and images, is the property of the company and is protected by copyright laws.',
            ),
            _buildSection(
              '8. Limitation of Liability',
              'We are not liable for any indirect, incidental, special, or consequential damages arising from your use of the platform.',
            ),
            _buildSection(
              '9. Modifications',
              'We reserve the right to modify these terms at any time. Your continued use of the platform after changes constitutes acceptance of the modified terms.',
            ),
            _buildSection(
              '10. Governing Law',
              'These terms shall be governed by and construed in accordance with the laws of Bangladesh.',
            ),
            SizedBox(height: 16),
            Text(
              'For questions regarding these terms, please contact us at legal@foodapp.com',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildSection(String title, String content) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
        ],
      ),
    );
  }
}
