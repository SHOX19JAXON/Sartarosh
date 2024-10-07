import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sartarosh/glogal_buuons_add_widgets/global_textfield.dart';
import 'package:sartarosh/utils/app_constants_RegExp/app_constants_RegExp.dart';
import 'package:sartarosh/utils/colors/app_colors.dart';
import 'package:sartarosh/utils/images/app_images.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool _hasImage = false;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Foydalanuvchi"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Spacer(),
                  Stack(
                    children: [

                      ClipOval(
                        child: Image.network(
                         "https://th.bing.com/th/id/R.c3631c652abe1185b1874da24af0b7c7?rik=XBP%2fc%2fsPy7r3HQ&riu=http%3a%2f%2fpluspng.com%2fimg-png%2fpng-user-icon-circled-user-icon-2240.png&ehk=z4ciEVsNoCZtWiFvQQ0k4C3KTQ6wt%2biSysxPKZHGrCc%3d&risl=&pid=ImgRaw&r=0",
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 120,
                        top: 120,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _hasImage = !_hasImage; // Rasm qo'shilganda shartni yangilash
                            });
                          },
                          child: _hasImage
                              ? const Icon(
                            Icons.camera_alt, // Rasm mavjud bo'lsa "Update" ikonasi
                            size: 32,
                          )
                              : const Icon(
                            Icons.add, // Rasm yo'q bo'lsa "Add" ikonasi
                            size: 32,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Isimni o'zgartirish"),
              GlobalTextField(
                title: 'Isim',
                validate: AppConstants.textRegExp,
                validateText: "To'gri isim kiritng",
                validateEmptyText: 'Isim kiriting',
                type: TextInputType.text,
                onChanged: (v) {},
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Telifon raqami o'zgartirish"),
              GlobalTextField(
                title: 'Tel raqam',
                validate: AppConstants.textRegExp,
                validateText: "To'gri raqam kiritng",
                validateEmptyText: 'raqam kiriting',
                type: TextInputType.phone,
                onChanged: (v) {},
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Gmail o'zgartirish"),
              GlobalTextField(
                title: 'Gmail',
                validate: AppConstants.textRegExp,
                validateText: "To'gri gmail kiritng",
                validateEmptyText: 'Gmail kiriting',
                type: TextInputType.emailAddress,
                onChanged: (v) {},
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Ma'lumotlarni saqlash uchun funksiyalarni qo'shishingiz mumkin
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
                        color: Colors.white,
                        width: 0.1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        "Saqlash".tr(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
