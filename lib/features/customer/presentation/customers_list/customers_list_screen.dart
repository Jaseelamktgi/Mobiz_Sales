import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobizsales/core/extensions/margin_extn.dart';
import 'package:mobizsales/core/navigators/page_navigator.dart';
import 'package:mobizsales/core/theme/colors.dart';
import 'package:mobizsales/core/widgets/app_text.dart';
import 'package:mobizsales/features/customer/presentation/customers_list/customers_list_cubit.dart';
import 'package:mobizsales/features/customer/presentation/selected_customer/selected_customer_screen.dart';

class CustomersListScreen extends StatelessWidget {
  const CustomersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (_) => CustomersListCubit()..initialize(),

      child: Scaffold(
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

          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: AppColors.white),
            ),

            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add, color: AppColors.white),
            ),
          ],
        ),

        body: BlocBuilder<CustomersListCubit, CustomersListState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.error != null) {
              return Center(child: AppText(state.error!, color: Colors.red));
            }

            if (state.customers.isEmpty) {
              return const Center(child: AppText("No Customers Found"));
            }

            return RefreshIndicator(
              onRefresh: () async {
                await context.read<CustomersListCubit>().refreshCustomers();
              },

              child: ListView.separated(
                padding: const EdgeInsets.all(12),

                itemCount: state.customers.length,

                separatorBuilder: (context, index) => 10.hBox,

                itemBuilder: (context, index) {
                  final customer = state.customers[index];

                  return GestureDetector(
                    onTap: () {
                      open(context, SelectedCustomerScreen(customer: customer));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),

                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),

                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,

                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withValues(
                                alpha: 0.1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),

                            child: Icon(
                              Icons.store,
                              color: AppColors.primaryColor,
                            ),
                          ),

                          12.wBox,

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                AppText(
                                  customer.name ?? "No Name",
                                  weight: FontWeight.w600,
                                  size: 15,
                                ),

                                5.hBox,

                                AppText(
                                  "Address: ${customer.address ?? "No Address"}",
                                  size: 12,
                                  color: Colors.grey,
                                ),

                                3.hBox,

                                AppText(
                                  "Contact: ${customer.contactNumber ?? "No Contact"}",
                                  size: 12,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
