import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sartarosh/utils/extensions/size.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';

class GlobalTextButton extends StatelessWidget {
  const GlobalTextButton({
    super.key,
    required this.onTap,
    required this.text,
    this.isLoading = false,
  });

  final VoidCallback onTap;
  final String text;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: isLoading
              ? AppColors.c130160.withOpacity(0.5)
              : AppColors.c130160,
        ),
        onPressed: isLoading ? () {} : onTap,
        child:    Text(
                text,
                style: AppTextStyle.sansBold
                    .copyWith(fontSize: 14, color: Colors.white),
              ),
      ),
    );
  }
}
