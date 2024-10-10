import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sartarosh/data/models/barbers_model.dart';

import 'package:sartarosh/screens/barber_work/barber_project_screen/barber_project_screen.dart';
import 'package:sartarosh/screens/barber_work_detaile/barabe_work_detaile2.dart';
import 'package:sartarosh/screens/booking/booking.dart';
import 'package:sartarosh/screens/home_screen/widget/description_item.dart';
import 'package:sartarosh/utils/colors/app_colors.dart';
import 'package:sartarosh/utils/images/app_images.dart';

class BarberInfo extends StatefulWidget {
  final BarbersModel userModel;

  const BarberInfo({
    super.key,
    required this.userModel,
  });

  @override
  State<BarberInfo> createState() => _BarberInfoState();
}

class _BarberInfoState extends State<BarberInfo> {
  // Foto va video holatini saqlash
  bool _isPhotoView = true;

  @override
  Widget build(BuildContext context) {
    // Hozirgi tema holatini tekshirish
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final barber = widget.userModel;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        title: Text(
          "${widget.userModel.name} ${widget.userModel.surname}",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Yuqoridagi kodlar o'zgarmas
            Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    widget.userModel.image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 30),
                Column(
                  children: [
                    Text(
                      "${widget.userModel.fotos.length}",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "Foto",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(width: 30),
                Column(
                  children: [
                    Text(
                      "${widget.userModel.fotos.length}",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "Video",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    Text(
                      "${widget.userModel.workExperience}",
                      style: TextStyle(color: Colors.black),
                    ),
                    RatingBar.builder(
                      ignoreGestures: true,
                      itemSize: 18,
                      initialRating: widget.userModel.skills.toDouble(),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    const SizedBox(height: 2),
                    Text(
                      "age".tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "experience".tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "phone".tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Gmail",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Telegram",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Instagram",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 2),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          "${widget.userModel.age} ",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          "years_old".tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          "${widget.userModel.workExperience} ".tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          "years_of_experience".tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.userModel.phoneNumber,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.userModel.email,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "@JalilchikBarber",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Jalilchik2001",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 2),
                  ],
                ),
                const Spacer(),
              ],
            ),
            const CompanyDescriptionItem(
                description:
                    "Alaska 10 yildan buyon o'zining mijozlariiga sifatli xizmat qilib kelmoqda. Samarqanddagi top 10 talikdagi erkaklar sartarosh xonasi bo'lib, siz bu yerda istalgan soch turmagingizni qilish imkoniga egasiz"),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Bron qilish jarayoniga yo'naltirish yoki ochish
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BookingScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    child: Container(
                      // width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        // gradient: const LinearGradient(
                        //   colors: [
                        //     AppColors.c355353,
                        //     AppColors.c355353,
                        //     AppColors.c355353,
                        //   ],
                        //   begin: Alignment.topCenter,
                        //   end: Alignment.bottomCenter,
                        // ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          "Book Now",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    // width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const BarberProjectScreen();
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          border: Border.all(
                            color: AppColors.white,
                            width: 0.1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            "view_works".tr(),
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Foto va video tugmalari
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              _isPhotoView = true; // Foto ko‘rinishiga o‘ting
                            });
                          },
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                          )),
                      Container(
                        width: 160,
                        height: 3,
                        color: _isPhotoView == true
                            ? Colors.black
                            : AppColors.white,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              _isPhotoView = false; // Video ko‘rinishiga o‘ting
                            });
                          },
                          child: const Icon(
                            Icons.video_collection,
                            color: Colors.black,
                          )),
                      Container(
                        width: 160,
                        height: 3,
                        color: _isPhotoView == false
                            ? Colors.black
                            : AppColors.white,
                      ),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Foto yoki video ko‘rsatish
            _isPhotoView
                ? (barber.fotos.isNotEmpty
                    ? GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                        ),
                        itemCount: barber.fotos.length,
                        itemBuilder: (context, index) {
                          return

                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return WorkBarerInfo();
                                    }));
                              },
                              child:   ClipRRect(
                                // borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "${barber.fotos[index].image[0]}",
                                  fit: BoxFit.cover,
                                ),
                              )
                            );


                        },
                      )
                    : const Center(
                        child: Icon(
                            Icons.image_not_supported), // "Mavjud emas" ikoni
                      ))
                : (barber.fotos.isNotEmpty
                    ? GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                        ),
                        itemCount: barber.fotos.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return WorkBarerInfo();
                              }));
                            },
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                // Agar rasm bo'lsa
                                Image.network(
                                  "https://th.bing.com/th/id/OIP.fK3rbS2gV-RWPztsdhAj6QAAAA?pid=ImgDet&w=177&h=221&c=7&dpr=1.3",
                                  fit: BoxFit.cover,
                                ),
                                if (barber.fotos.isNotEmpty)
                                  Positioned(
                                    right: 5,
                                    top: 5,
                                    child: Icon(Icons.play_circle,
                                        color: Colors.white.withOpacity(0.7)),
                                  ),
                              ],
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Icon(Icons
                            .video_collection_rounded), // "Mavjud emas" ikoni
                      )),
          ],
        ),
      ),
    );
  }
}


