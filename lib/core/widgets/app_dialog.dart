import 'package:flutter/material.dart';
import 'package:mobizsales/core/theme/colors.dart';

Future<void> openAsAlertDialog(
  BuildContext context, {
  required Widget content,
  String? btnText,
  VoidCallback? onPressed,
  bool? barrierDismissible,
}) async {
  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible ?? true,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: AppColors.white,
        child: SafeArea(
          child: Padding(padding: const EdgeInsets.all(12), child: content),
        ),
      );
    },
  );
}
