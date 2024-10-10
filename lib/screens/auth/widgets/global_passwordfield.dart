import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sartarosh/utils/extensions/size.dart';
import 'package:sartarosh/utils/styles/app_text_style.dart';
import '../../../utils/colors/app_colors.dart';

class GlobalPasswordField extends StatefulWidget {
  const GlobalPasswordField({
    super.key,
    required this.title,
    required this.icon,
    required this.controller,
    required this.validate,
    required this.formKey,
  });

  final String title;
  final Widget icon;
  final TextEditingController controller;
  final RegExp validate;
  final GlobalKey formKey;

  @override
  State<GlobalPasswordField> createState() => _GlobalPasswordFieldState();
}

class _GlobalPasswordFieldState extends State<GlobalPasswordField> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.18),
              blurRadius: 62,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextFormField(
          style: AppTextStyle.sansRegular.copyWith(fontSize: 14),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value!.isEmpty) {
              return "enter_your_password".tr();
            }
            if (!widget.validate.hasMatch(value)) {
              return "weak_password".tr();
            }
            return null;
          },
          textInputAction: TextInputAction.done,
          controller: widget.controller,
          obscureText: isVisible,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.blue,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.only(top: 17.h, bottom: 17.h),
            prefixIcon: widget.icon,
            suffixIcon: Material(
              color: Colors.transparent,
              child: Ink(
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    isVisible = !isVisible;
                    setState(() {});
                  },
                  child: isVisible
                      ? const Icon(Icons.remove_red_eye)
                      : const Icon(Icons.visibility_off),
                ),
              ),
            ),
            hintText: widget.title,
            hintStyle: AppTextStyle.sansRegular.copyWith(
              fontSize: 14,
              color: AppColors.c0D0140.withOpacity(0.6),
            ),
          ),
        ),
      ),
    );
  }
}
