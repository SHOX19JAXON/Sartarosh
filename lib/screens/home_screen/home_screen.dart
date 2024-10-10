import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:sartarosh/screens/home_screen/app_drawer/languages_screen/languages_screen.dart';
import 'package:sartarosh/screens/home_screen/app_drawer/map/map_screen.dart';
import 'package:sartarosh/screens/home_screen/app_drawer/notification/notification.dart';
import 'package:sartarosh/screens/home_screen/app_drawer/user_profil/user_profil.dart';
import 'package:sartarosh/screens/home_screen/widget/bron_times.dart';
import 'package:sartarosh/screens/home_screen/widget/description_item.dart';
import 'package:sartarosh/utils/colors/app_colors.dart';
import 'package:sartarosh/utils/images/app_images.dart';
import 'package:sartarosh/utils/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://th.bing.com/th/id/R.4064e98024c21397713fdfd83c74509c?rik=zXQmyr%2fpPUTFLw&pid=ImgRaw&r=0',
      'https://josephsbarber.de/wp-content/uploads/2020/07/einzigARTig-1968_039_-3-1024x681-1.jpg',
      'https://th.bing.com/th/id/R.8a366d8ce6b5bc621b6a92ce20ba769b?rik=XkxyX49QWcPv9g&pid=ImgRaw&r=0',
      'https://i.pinimg.com/736x/63/19/1a/63191a631425d2c0ba5566b70c6d938d.jpg',
      'https://th.bing.com/th/id/OIP.22cQIWqKH_iZbOBfOQkcyQHaE7?w=1400&h=933&rs=1&pid=ImgDetMain',
    ];

    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          'Alyaska'.tr(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Theme.of(context).shadowColor,
                size: 35,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {},
            child: Image.asset(
              AppImages.barber45,
              width: 60,
              height: 60,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: AppColors.c1B2B2B),
              child: Text(
                'Alyaska',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(
                'select_language'.tr(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LanguagesScreen();
                }));
              },
            ),
            ListTile(
              leading: Icon(
                context.isDarkTheme() ? Icons.shield_moon : Icons.sunny,
                color: context.isDarkTheme() ? Colors.white : Colors.yellow,
              ),
              title: Text(
                  context.isDarkTheme() ? 'dark_mode'.tr() : 'light_mode'.tr(),
                  style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                // Theme switching
                if (context.isDarkTheme()) {
                  AdaptiveTheme.of(context).setLight();
                } else {
                  AdaptiveTheme.of(context).setDark();
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on_outlined),
              title: Text('location'.tr(),
                  style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MapScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: Text('natification'.tr(),
                  style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(
                "user profile",
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserProfile()));
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 4 / 2,
                ),
                items: imgList
                    .map((item) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: NetworkImage(item),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ))
                    .toList(),
              ),
              const CompanyDescriptionItem(
                  description:
                      "Alaska 10 yildan buyon o'zining mijozlariiga sifatli xizmat qilib kelmoqda. Samarqanddagi top 10 talikdagi erkaklar sartarosh xonasi bo'lib, siz bu yerda istalgan soch turmagingizni qilish imkoniga egasiz"),

              const SizedBox(
                height: 20,
              ),
              const Text(
                "Sizning Bronlaringiz",
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 15,
              ),
              bronlar.isNotEmpty
                  ? Container(

                      decoration: BoxDecoration(
                        color: AppColors.c355353.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          ...List.generate(bronlar.length, (index) {
                            return const BronTimes(); // BronTimes chaqirildi
                          }),
                        ],
                      ),
                    )
                  : Container(

                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.c355353.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Sizning bronlaringiz yoq",
                            style: TextStyle(fontSize: 16),
                          ),
                          Lottie.asset(AppImages.empty2,
                              width: 200, height: 150)
                        ],
                      ),
                    ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<int> bronlar = [];
