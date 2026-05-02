import 'package:flutter/material.dart';
import 'package:mobizsales/core/extensions/margin_extn.dart';
import 'package:mobizsales/core/theme/colors.dart';
import 'package:mobizsales/core/widgets/app_text.dart';
import 'package:mobizsales/core/widgets/icon_container.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          "Dashboard",
          color: AppColors.white,
          size: 20,
          weight: FontWeight.w500,
        ),
        backgroundColor: AppColors.primaryColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications, color: AppColors.white),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          30.hBox,
          Align(
            alignment: Alignment.topCenter,
            child: AppText(
              "Mobiz Sales Dashboard",
              size: 16,
              weight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          100.hBox,
          iconContainer(Icons.people, "Customers"),
          20.hBox,
          iconContainer(Icons.scanner, "Invoices"),
        ],
      ),
    );
  }
}
