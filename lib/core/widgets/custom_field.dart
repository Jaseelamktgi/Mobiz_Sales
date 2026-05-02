import 'package:flutter/material.dart';
import 'package:mobizsales/core/extensions/margin_extn.dart';
import 'package:mobizsales/core/theme/colors.dart';

Widget customField({
  required TextEditingController controller,
  required String hint,
  required IconData icon,
  bool obscure = false,
  Widget? suffix,
  String? Function(String?)? validator,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade500, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black54, size: 24),
            10.wBox,
            Expanded(
              child: TextFormField(
                controller: controller,
                obscureText: obscure,
                validator: validator,
                style: const TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor,
                  ),
                  errorStyle: const TextStyle(height: 0.8, fontSize: 12),
                ),
              ),
            ),
            if (suffix != null) suffix,
          ],
        ),
      ),

      10.hBox,
    ],
  );
}
