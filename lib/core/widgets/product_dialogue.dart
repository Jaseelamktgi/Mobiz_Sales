import 'package:flutter/material.dart';
import 'package:mobizsales/core/extensions/margin_extn.dart';
import 'package:mobizsales/core/theme/colors.dart';
import 'package:mobizsales/core/widgets/app_text.dart';
import 'package:mobizsales/features/products/data/repo/products_repo.dart';

Future<void> openProductDialog(
  BuildContext context, {
  required String productId,
  required String productName,
  required Function(Map<String, dynamic>) onSave,
}) async {
  final qtyController = TextEditingController(text: "1");
  final amountController = TextEditingController();

  final productTypes = await ProductsRepository.getProductTypes();
  final detail = await ProductsRepository.getProductDetail(
    productId: productId,
  );

  final List<Map<String, dynamic>> units = [];

  final dataList = detail?['data'] as List? ?? [];

  for (var item in dataList) {
    final unitList = item['units'] as List? ?? [];

    for (var u in unitList) {
      units.add({"id": u['id'], "name": u['name'], "price": item['price']});
    }
  }

  Map<String, dynamic>? selectedType = productTypes.isNotEmpty
      ? productTypes.first
      : null;

  Map<String, dynamic>? selectedUnit = units.isNotEmpty ? units.first : null;

  if (selectedUnit != null) {
    amountController.text = selectedUnit['price']?.toString() ?? "0";
  }

  await showDialog(
    context: context,
    builder: (_) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      "$productId | $productName",
                      weight: FontWeight.bold,
                      size: 16,
                    ),
                    15.hBox,
                    Center(
                      child: Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.image, size: 40),
                      ),
                    ),

                    15.hBox,
                    const AppText("Product Type"),
                    5.hBox,
                    DropdownButtonFormField<Map<String, dynamic>>(
                      value: selectedType,
                      decoration: fieldDecoration(),
                      dropdownColor: AppColors.appGrey,
                      items: productTypes
                          .map<DropdownMenuItem<Map<String, dynamic>>>((e) {
                            return DropdownMenuItem<Map<String, dynamic>>(
                              value: e,
                              child: Text(e['name'].toString()),
                            );
                          })
                          .toList(),

                      onChanged: (value) {
                        setState(() {
                          selectedType = value;
                        });
                      },
                    ),
                    12.hBox,
                    const AppText("Units"),
                    5.hBox,
                    DropdownButtonFormField<Map<String, dynamic>>(
                      value: selectedUnit,
                      decoration: fieldDecoration(),
                      dropdownColor: AppColors.appGrey,

                      items: units.map<DropdownMenuItem<Map<String, dynamic>>>((
                        e,
                      ) {
                        return DropdownMenuItem<Map<String, dynamic>>(
                          value: e,
                          child: AppText(e['name'].toString()),
                        );
                      }).toList(),

                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            selectedUnit = value;
                            amountController.text =
                                value['price']?.toString() ?? "0";
                          });
                        }
                      },
                    ),
                    12.hBox,
                    const AppText("Amount"),
                    5.hBox,
                    TextField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: fieldDecoration(),
                    ),
                    12.hBox,
                    const AppText("Quantity"),
                    5.hBox,
                    TextField(
                      controller: qtyController,
                      keyboardType: TextInputType.number,
                      decoration: fieldDecoration(),
                    ),
                    18.hBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const AppText("Close"),
                        ),

                        10.wBox,

                        ElevatedButton(
                          onPressed: () {
                            if (selectedType == null || selectedUnit == null)
                              return;

                            final qty = int.tryParse(qtyController.text) ?? 1;

                            final rate =
                                double.tryParse(amountController.text) ?? 0;

                            onSave({
                              "id": int.parse(productId),
                              "name": productName,
                              "product_type": selectedType!['id'],
                              "type": selectedType!['name'],
                              "unit_id": selectedUnit!['id'],
                              "unit": selectedUnit!['name'],
                              "qty": qty,
                              "rate": rate,
                              "amount": qty * rate,
                            });

                            Navigator.pop(context);
                          },
                          child: const AppText("Save"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

InputDecoration fieldDecoration() {
  return InputDecoration(
    filled: true,
    fillColor: const Color.fromARGB(255, 219, 212, 212),
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
    ),
  );
}
