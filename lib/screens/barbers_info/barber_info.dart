
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sartarosh/data/models/barbers_model.dart';
import 'package:sartarosh/screens/add_works.dart';
import 'package:sartarosh/screens/barber_work/barber_project_screen/barber_project_screen.dart';
import 'package:sartarosh/utils/colors/app_colors.dart';

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
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: isDarkMode
                    ? const LinearGradient(
                  colors: [
                    Color(0xFF030305),
                    Color(0xFF0D0F19),
                    Color(0xFF272827)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
                    : const LinearGradient(
                  colors: [
                    AppColors.c355353,
                    AppColors.c355353,
                    AppColors.c355353,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                border: Border.all(
                  color: AppColors.white,
                  width: 0.1,
                ),
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Column(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        widget.userModel.image,
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            SizedBox(
                              child: Text(
                                "full_name".tr(),
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "age".tr(),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "experience".tr(),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "phone".tr(),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "Gmail",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "rating".tr(),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            Text(
                              "${widget.userModel.name} ${widget.userModel.surname}",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "${widget.userModel.age} years_old".tr(),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "${widget.userModel.workExperience} years_of_experience"
                                  .tr(),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              widget.userModel.phoneNumber,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              widget.userModel.email,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 6),
                            RatingBar.builder(
                              ignoreGestures: true,
                              itemSize: 18,
                              initialRating:
                              widget.userModel.skills.toDouble(),
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
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Text(
                "This example shows a custom implementation...",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Bron qilish jarayoniga yo'naltirish yoki ochish
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingScreen(),
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
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0C0F18), Color(0xFF272827)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "Book Now",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            )
,
            SizedBox(
              width: double.infinity,
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
                    gradient: isDarkMode
                        ? const LinearGradient(
                      colors: [
                        Color(0xFF030305),
                        Color(0xFF0D0F19),
                        Color(0xFF272827)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )
                        : const LinearGradient(
                      colors: [
                        AppColors.c355353,
                        AppColors.c355353,
                        AppColors.c355353,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
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
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
