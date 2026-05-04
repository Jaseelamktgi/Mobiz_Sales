import 'package:flutter/material.dart';
import 'package:mobizsales/core/extensions/margin_extn.dart';
import 'package:mobizsales/core/navigators/page_navigator.dart';
import 'package:mobizsales/core/theme/colors.dart';
import 'package:mobizsales/core/widgets/app_text.dart';
import 'package:mobizsales/core/widgets/dashboard_card.dart';
import 'package:mobizsales/features/customer/data/models/customer_model.dart';
import 'package:mobizsales/features/invoice/presentation/create_invoice/create_invoice_screen.dart';

class SelectedCustomerScreen extends StatelessWidget {
  final CustomerData customer;

  const SelectedCustomerScreen({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: const AppText(
          "Customers",
          color: AppColors.white,
          size: 18,
          weight: FontWeight.w600,
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blueGrey.shade100,

              child: Padding(
                padding: const EdgeInsets.all(15),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    AppText(
                      customer.name ?? "No Name",
                      size: 18,
                      weight: FontWeight.w500,
                    ),

                    10.hBox,

                    Row(
                      children: [
                        Container(
                          height: 150,
                          width: 150,

                          decoration: BoxDecoration(
                            color: const Color.fromARGB(185, 230, 223, 223),
                            borderRadius: BorderRadius.circular(5),
                          ),

                          child: Center(
                            child: Icon(
                              Icons.camera_front,
                              size: 50,
                              color: AppColors.appGrey,
                            ),
                          ),
                        ),

                        15.wBox,

                        Expanded(
                          child: Column(
                            spacing: 10,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_city,
                                    color: AppColors.appGrey,
                                  ),
                                  5.wBox,
                                  Expanded(
                                    child: AppText(
                                      customer.address ?? "No Address",
                                    ),
                                  ),
                                ],
                              ),

                              5.hBox,

                              Row(
                                children: [
                                  Icon(Icons.phone, color: AppColors.appGrey),
                                  5.wBox,
                                  AppText(
                                    customer.contactNumber ?? "No Contact",
                                  ),
                                ],
                              ),

                              5.hBox,

                              Row(
                                children: [
                                  Icon(Icons.email, color: AppColors.appGrey),
                                  5.wBox,
                                  Expanded(
                                    child: AppText(
                                      customer.email ?? "No Email",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    10.hBox,

                    AppText(
                      'Customer Type : ${customer.paymentTerms ?? "CASH"}',
                      size: 16,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),

            50.hBox,

            Align(
              alignment: Alignment.center,
              child: dashboardCard(
                Icons.store,
                "Sales",
                onTap: () {
                  open(
                    NavigationService.context!,
                    CreateInvoiceScreen(
                      customerId: customer.id!,
                      customerName: customer.name ?? "No Name",
                    ),
                  );
                },
              ),
            ),
            20.hBox,
          ],
        ),
      ),
    );
  }
}
