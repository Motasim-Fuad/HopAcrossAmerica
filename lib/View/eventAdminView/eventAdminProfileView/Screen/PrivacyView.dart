import 'package:flutter/material.dart';

class PrivacyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Last updated: November 2024',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 24),
            _buildSection(
              '1. Information We Collect',
              'We collect information you provide directly to us when you create an account, place orders, or contact customer support. This includes your name, email address, phone number, delivery address, and payment information.',
            ),
            _buildSection(
              '2. How We Use Your Information',
              'We use the information we collect to process your orders, provide customer support, send you updates about your orders, and improve our services. We may also use your information for marketing purposes with your consent.',
            ),
            _buildSection(
              '3. Information Sharing',
              'We share your information with restaurants to fulfill your orders and with delivery partners to deliver your food. We do not sell your personal information to third parties.',
            ),
            _buildSection(
              '4. Data Security',
              'We implement appropriate security measures to protect your personal information. However, no method of transmission over the internet is 100% secure.',
            ),
            _buildSection(
              '5. Your Rights',
              'You have the right to access, update, or delete your personal information. You can do this through your account settings or by contacting us directly.',
            ),
            _buildSection(
              '6. Cookies',
              'We use cookies and similar technologies to enhance your experience on our platform and analyze usage patterns.',
            ),
            _buildSection(
              '7. Changes to Privacy Policy',
              'We may update this privacy policy from time to time. We will notify you of any changes by posting the new policy on this page.',
            ),
            SizedBox(height: 16),
            Text(
              'If you have any questions about this privacy policy, please contact us at privacy@foodapp.com',
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