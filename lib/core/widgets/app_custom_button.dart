import 'package:flutter/material.dart';
import 'package:mobizsales/core/theme/colors.dart';
import 'package:mobizsales/core/widgets/app_text.dart';

class AppCustomButton extends StatelessWidget {
  final String btntext;
  final String? family;
  final Color? color, bgColor;
  final VoidCallback? onTap;
  final double? width, radius, verticalPadding, textSize;
  final bool isOutlinedBtn;
  final Color? borderColor;
  final bool isLoading;

  const AppCustomButton({
    super.key,
    required this.btntext,
    this.family,
    this.color,
    this.bgColor,
    this.onTap,
    this.radius,
    this.isOutlinedBtn = false,
    this.width,
    this.textSize,
    this.verticalPadding,
    this.borderColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,

      child: Container(
        width: width ?? MediaQuery.sizeOf(context).width,
        padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 5),
          color: isOutlinedBtn
              ? Colors.transparent
              : bgColor ?? AppColors.white,
          border: isOutlinedBtn
              ? Border.all(color: borderColor ?? AppColors.white, width: 1)
              : null,
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      color ?? AppColors.black,
                    ),
                  ),
                )
              : AppText(
                  btntext,
                  color: color ?? AppColors.black,
                  align: TextAlign.center,
                  family: family,
                  weight: FontWeight.w500,
                  size: textSize ?? 15,
                ),
        ),
      ),
    );
  }
}
