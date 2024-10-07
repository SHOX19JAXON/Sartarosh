import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sartarosh/screens/barbers/barbers_screen.dart';
import 'package:sartarosh/screens/home_screen/app_drawer/languages_screen/languages_screen.dart';
import 'package:sartarosh/screens/home_screen/app_drawer/map/map_screen.dart';
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
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          'Alyaska'.tr(),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Theme.of(context).shadowColor),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor :Colors.grey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
              const DrawerHeader(

        // backgroundBlendMode :Color(0xFF272827),
              decoration: BoxDecoration(
        //
                color:
                AppColors.c1B2B2B
              ),
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
              title: Text('select_language'.tr(),style:  Theme.of(context).textTheme.bodyMedium,),
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
                  context.isDarkTheme() ? 'dark_mode'.tr() : 'light_mode'.tr(),style: Theme.of(context).textTheme.bodyMedium),
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
              title: Text('location'.tr(),style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MapScreen()));
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Image.asset(
              AppImages.barber45,
              width: 250,
              height: 250,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Text(
                "data".tr(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const BarbersScreen();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  // Container uchun paddingni olib tashlash
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
                    // color: Colors.red,
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
                      "masters_list".tr(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
