import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobizsales/core/extensions/margin_extn.dart';
import 'package:mobizsales/core/theme/colors.dart';
import 'package:mobizsales/core/widgets/app_text.dart';
import 'package:mobizsales/features/products/presentation/product_list_screen.dart';
import 'create_invoice_cubit.dart';

class CreateInvoiceScreen extends StatelessWidget {
  final int customerId;
  final String customerName;

  const CreateInvoiceScreen({
    super.key,
    required this.customerId,
    required this.customerName,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (_) => CreateInvoiceCubit(),
      child: BlocListener<CreateInvoiceCubit, CreateInvoiceState>(
        listener: (context, state) {
          if (state.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Invoice Created Successfully")),
            );

            Navigator.pop(context);
          }

          if (state.error != null) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error!)));
          }
        },
        child: BlocBuilder<CreateInvoiceCubit, CreateInvoiceState>(
          builder: (context, state) {
            final cubit = context.read<CreateInvoiceCubit>();
            return Scaffold(
              backgroundColor: const Color(0xffefeff4),
              appBar: AppBar(
                backgroundColor: AppColors.primaryColor,
                title: const AppText(
                  "Sales",
                  color: AppColors.white,
                  size: 18,
                  weight: FontWeight.w600,
                ),
                actions: [
                  IconButton(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: cubit,
                            child: const ProductListScreen(),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.search, color: Colors.white),
                  ),
                ],
              ),

              body: Padding(
                padding: const EdgeInsets.all(12),

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(customerName, color: AppColors.appGrey),

                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => cubit.toggleVat(true),
                              child: Container(
                                color: state.isVat
                                    ? AppColors.primaryColor
                                    : Colors.white,
                                padding: const EdgeInsets.all(8),
                                child: AppText(
                                  "VAT",
                                  color: state.isVat
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => cubit.toggleVat(false),
                              child: Container(
                                color: !state.isVat
                                    ? AppColors.primaryColor
                                    : Colors.white,
                                padding: const EdgeInsets.all(8),
                                child: AppText(
                                  "NO VAT",
                                  color: !state.isVat
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    10.hBox,
                    Expanded(
                      child: state.items.isEmpty
                          ? const Center(child: AppText("No products added"))
                          : ListView.builder(
                              itemCount: state.items.length,
                              itemBuilder: (context, index) {
                                final item = state.items[index];

                                return Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: AppText(
                                              "${item.code} | ${item.name}",
                                              weight: FontWeight.w500,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () =>
                                                cubit.removeProduct(index),
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),

                                      6.hBox,

                                      AppText(
                                        "${item.type} | ${item.unit} | Qty:${item.qty} | Rate:${item.rate} | Amt:${item.amount.toStringAsFixed(2)}",
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                    ),

                    Row(
                      children: [
                        const SizedBox(width: 70, child: AppText("Remarks")),
                        Expanded(
                          child: TextField(
                            controller: cubit.remarksController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    10.hBox,
                    Row(
                      children: [
                        const SizedBox(width: 70, child: AppText("Discount")),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => cubit.toggleDiscount(true),
                              child: Container(
                                color: state.isAmount
                                    ? AppColors.primaryColor
                                    : Colors.white,
                                padding: const EdgeInsets.all(8),
                                child: AppText(
                                  "AMOUNT",
                                  color: state.isAmount
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => cubit.toggleDiscount(false),
                              child: Container(
                                color: !state.isAmount
                                    ? AppColors.primaryColor
                                    : Colors.white,
                                padding: const EdgeInsets.all(8),
                                child: AppText(
                                  "PERCENT",
                                  color: !state.isAmount
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),

                        8.wBox,

                        Expanded(
                          child: TextField(
                            controller: cubit.discountController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    12.hBox,

                    Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppText("Total: ${state.total.toStringAsFixed(2)}"),
                          AppText("Tax: ${state.tax.toStringAsFixed(2)}"),
                          AppText(
                            "Round Off: ${state.roundOff.toStringAsFixed(2)}",
                          ),
                          AppText(
                            "Grand Total: ${state.grandTotal.toStringAsFixed(2)}",
                            weight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                    15.hBox,
                    SizedBox(
                      width: 150,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                        ),
                        onPressed: () {
                          cubit.createInvoice(customerId: customerId);
                        },
                        child: state.isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const AppText("SAVE"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
