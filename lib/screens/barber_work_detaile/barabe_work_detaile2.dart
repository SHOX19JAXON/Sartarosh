import 'package:flutter/material.dart';
import 'package:sartarosh/utils/images/app_images.dart';

class WorkBarerInfo extends StatelessWidget {
  const WorkBarerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          ...List.generate(
            soch.length,
            (index) {
              return ClipRRect(
                child: Image.asset(soch[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}

List<String> soch = [
  AppImages.soch1,
  AppImages.soch2,
  AppImages.soch3,
  AppImages.soch4,
  AppImages.soch5,
];
