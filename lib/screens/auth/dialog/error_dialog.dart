import 'package:flutter/material.dart';
import 'package:sartarosh/screens/auth/widgets/global_textbutton.dart';
import 'package:sartarosh/utils/styles/app_text_style.dart';

errorDialog({
  required BuildContext context,
  required String errorText,
}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "!!!",
                  style: AppTextStyle.sansBold
                      .copyWith(color: Colors.redAccent, fontSize: 20),
                ),
                Text(
                  errorText,
                  style: AppTextStyle.sansBold
                      .copyWith(color: Colors.redAccent, fontSize: 24),
                ),
                const SizedBox(height: 20),
                GlobalTextButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    text: "Ok")
              ],
            ),
          ),
        );
      });
}
