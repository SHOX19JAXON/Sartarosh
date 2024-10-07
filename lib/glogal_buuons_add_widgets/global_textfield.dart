import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sartarosh/utils/colors/app_colors.dart';
import 'package:sartarosh/utils/styles/app_text_style.dart';


class GlobalTextField extends StatelessWidget {
  const GlobalTextField({
    super.key,
    this.controller,
    this.focusNode,
    required this.title,
    this.icon,
    this.maxLines,
    required this.validate,
    required this.validateText,
    required this.validateEmptyText,
    required this.type,
    required this.onChanged,
  });

  final FocusNode? focusNode;
  final String title;
  final int? maxLines;
  final String validateText;
  final String validateEmptyText;
  final Widget? icon;
  final TextEditingController? controller;
  final RegExp validate;

  final TextInputType type;

  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: AppColors.borderColor.withOpacity(0.18),
          //     blurRadius: 62,
          //     offset: const Offset(0, 4),
          //   ),
          // ],
          ),
      child: TextFormField(
        maxLines: maxLines ?? 1,
        style: AppTextStyle.interRegular.copyWith(fontSize: 14),
        onChanged: onChanged,
        textInputAction: TextInputAction.next,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value!.isEmpty) {
            return validateEmptyText;
          }
          if (!validate.hasMatch(value) || value.length < 3) {
            return validateText;
          }
          return null;
        },
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.c150B3D,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.c150B3D,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.c150B3D,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
          prefixIcon: icon,
          hintText: title,
          hintStyle: AppTextStyle.interRegular.copyWith(
            fontSize: 14,
            color: AppColors.black.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}
