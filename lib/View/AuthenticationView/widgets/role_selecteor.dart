import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoleSelectorWidget extends StatelessWidget {
  final RxString selectedRole;
  final Function(String) onRoleSelected;

  const RoleSelectorWidget({
    Key? key,
    required this.selectedRole,
    required this.onRoleSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'User Role',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF2C3E50),
          ),
        ),
        const SizedBox(height: 8),
        Obx(() => Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF8F9FA),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFFE5E7EB),
              width: 1,
            ),
          ),
          child: DropdownButtonFormField<String>(
            value: selectedRole.value.isEmpty ? null : selectedRole.value,
            decoration: const InputDecoration(
              hintText: 'Select Your Role',
              hintStyle: TextStyle(
                fontSize: 14,
                color: Color(0xFF9CA3AF),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Color(0xFF6B7280),
            ),
            dropdownColor: Colors.white,
            items: const [
              DropdownMenuItem(
                value: 'Shopper',
                child: Text(
                  'Shopper',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF2C3E50),
                  ),
                ),
              ),
              DropdownMenuItem(
                value: 'Event Admin',
                child: Text(
                  'Event Admin',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF2C3E50),
                  ),
                ),
              ),
            ],
            onChanged: (value) {
              if (value != null) {
                onRoleSelected(value);
              }
            },
          ),
        )),
      ],
    );
  }
}