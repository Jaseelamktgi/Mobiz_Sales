import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobizsales/core/extensions/margin_extn.dart';
import 'package:mobizsales/core/theme/colors.dart';
import 'package:mobizsales/core/widgets/app_text.dart';
import 'package:mobizsales/features/invoice/presentation/invoice_list/invoice_list_cubit.dart';

class InvoiceListScreen extends StatelessWidget {
  const InvoiceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (_) => InvoiceListCubit(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          actionsIconTheme: const IconThemeData(color: AppColors.white),
          backgroundColor: AppColors.primaryColor,
          title: const AppText(
            "Sales Invoices",
            color: AppColors.white,
            size: 18,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: AppColors.white),
            ),
          ],
        ),

        body: BlocBuilder<InvoiceListCubit, InvoiceListState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.error != null) {
              return Center(child: AppText(state.error!));
            }

            if (state.invoices.isEmpty) {
              return const Center(child: AppText("No Invoices Found"));
            }

            return RefreshIndicator(
              onRefresh: () async {
                await context.read<InvoiceListCubit>().refreshInvoices();
              },

              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: state.invoices.length,
                separatorBuilder: (context, index) => 10.hBox,

                itemBuilder: (context, index) {
                  final invoice = state.invoices[index];

                  return Container(
                    padding: const EdgeInsets.all(14),

                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          "${invoice.id} | ${invoice.inDate} ${invoice.inTime}",
                        ),

                        AppText("Total : ${invoice.total}"),
                        6.hBox,

                        AppText("Round Off : ${invoice.roundOff}"),
                        6.hBox,

                        AppText("Total Vat : ${invoice.totalTax}"),

                        AppText(
                          "Grand Total : ${invoice.grandTotal}",
                          weight: FontWeight.w600,
                        ),
                      ],
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
