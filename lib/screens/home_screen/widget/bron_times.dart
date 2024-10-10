import 'package:flutter/material.dart';
import 'package:sartarosh/utils/colors/app_colors.dart';
import 'package:sartarosh/utils/images/app_images.dart';
class BronTimes extends StatelessWidget {
  const BronTimes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: (){

            },
            child: Container(

                decoration: BoxDecoration(
                    color: AppColors.c355353.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)
                ),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Image.asset(
                        AppImages.barber45,
                        width: 55,
                        height: 55,
                      ),
                      const SizedBox(width: 15,),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("sartarosh"),
                          SizedBox(height: 5,),
                          Text("Sana"),
                          SizedBox(height: 5,),
                          Text("Soat"),
                          SizedBox(height: 5,),
                        ],
                      ),
                      SizedBox(width: 20,),

                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Azimov Ulug'bek"),
                          SizedBox(height: 5,),
                          Text("19.08.2024"),
                          SizedBox(height: 5,),
                          Text("14:00"),
                          SizedBox(height: 5,),
                        ],
                      )
                    ],
                  ),
                )
            ),
          ),
        ),
        const SizedBox(height: 15,),
      ],
    );
  }
}
