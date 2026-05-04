import 'package:flutter/material.dart';
import 'package:mobizsales/core/extensions/margin_extn.dart';
import 'package:mobizsales/core/theme/colors.dart';
import 'package:mobizsales/core/widgets/app_text.dart';

Widget dashboardCard(IconData icon, String text, {VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.white, size: 30),
          5.hBox,
          AppText(text, color: AppColors.white, size: 14),
        ],
      ),
    ),
  );
}
