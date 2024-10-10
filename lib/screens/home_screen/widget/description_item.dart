import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sartarosh/utils/colors/app_colors.dart';
import 'package:sartarosh/utils/styles/app_text_style.dart';


class CompanyDescriptionItem extends StatefulWidget {
  const CompanyDescriptionItem({super.key, required this.description});

  final String description;

  @override
  State<CompanyDescriptionItem> createState() => _CompanyDescriptionItemState();
}

class _CompanyDescriptionItemState extends State<CompanyDescriptionItem> {
  bool _showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          firstChild: Text(
            widget.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium
          ),
          secondChild: Text(
            widget.description,
            style: Theme.of(context).textTheme.bodyMedium
          ),
          crossFadeState: _showFullDescription
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
        ),
        SizedBox(height: 0),
        CompanyButton(
          onTap: () {
            setState(() {
              _showFullDescription = !_showFullDescription;
            });
          },
          title: _showFullDescription ? "Aisqa".tr() : "Davom".tr(),
          widthButton: 90,
          backgroundColor: AppColors.c355353,
        ),
      ],
    );
  }
}




/// global button juda xato yozilgan !!!
class CompanyButton extends StatelessWidget {
  const CompanyButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.widthButton,
    required this.backgroundColor,
  });

  final Color backgroundColor;
  final VoidCallback onTap;
  final String title;

  final double widthButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: widthButton,
      child: InkWell(
        // style: TextButton.styleFrom(
        //   padding: const EdgeInsets.symmetric(vertical: 0),
        //   backgroundColor: backgroundColor,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(12),
        //   ),
        // ),
        onTap: onTap,
        child: Text(title,
            style: const TextStyle(fontSize: 14, color: Colors.blue)),
      ),
    );
  }
}

