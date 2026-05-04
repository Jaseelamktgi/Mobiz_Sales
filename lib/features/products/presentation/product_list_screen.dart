import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobizsales/core/extensions/margin_extn.dart';
import 'package:mobizsales/core/theme/colors.dart';
import 'package:mobizsales/core/widgets/app_text.dart';
import 'package:mobizsales/core/widgets/product_dialogue.dart';
import 'package:mobizsales/features/invoice/presentation/create_invoice/create_invoice_cubit.dart';
import 'package:mobizsales/features/products/presentation/products_list_cubit.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (_) => ProductsListCubit(),
      child: const ProductListView(),
    );
  }
}

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const AppText(
          "Products",
          color: AppColors.white,
          size: 18,
          weight: FontWeight.w600,
        ),
      ),

      body: BlocBuilder<ProductsListCubit, ProductsListState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null) {
            return Center(child: AppText(state.error!));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: state.products.length,
            separatorBuilder: (context, index) => 10.hBox,
            itemBuilder: (context, index) {
              final product = state.products[index];

              return InkWell(
                onTap: () async {
                  await openProductDialog(
                    context,
                    productId: product.id.toString(),
                    productName: product.name ?? "",
                    onSave: (item) {
                      context.read<CreateInvoiceCubit>().addProduct(
                        id: item["id"],
                        code: item["id"].toString(),
                        name: item["name"],
                        type: item["type"],
                        productTypeId: item["product_type"],
                        unit: item["unit"],
                        unitId: item["unit_id"],
                        qty: item["qty"],
                        rate: item["rate"],
                      );
                    },
                  );
                },

                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withValues(alpha: .1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.inventory_2,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      12.wBox,
                      Expanded(
                        child: AppText(
                          "${product.id} | ${product.name}",
                          weight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
