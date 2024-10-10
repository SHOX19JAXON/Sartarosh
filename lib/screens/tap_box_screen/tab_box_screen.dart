import 'package:flutter/material.dart';

import 'package:sartarosh/screens/barbers/barbers_screen.dart';
import 'package:sartarosh/screens/booking/booking.dart';
import 'package:sartarosh/screens/home_screen/home_screen.dart';
import 'package:sartarosh/utils/colors/app_colors.dart';

class TabBox1 extends StatefulWidget {
  const TabBox1({super.key});

  @override
  State<TabBox1> createState() => _TabBox1State();
}

class _TabBox1State extends State<TabBox1> {
  List<Widget> _screens = [];
  int _activeIndex = 0;

  @override
  void initState() {
    _screens = [
      const HomeScreen(),
      const BarbersScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _screens[_activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.white,
        onTap: (newActiveIndex) {
          _activeIndex = newActiveIndex;
          setState(() {});
        },
        currentIndex: _activeIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 12,
        backgroundColor: AppColors.c355353,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: Colors.white,
              size: 40,
            ),
            icon: Icon(
              Icons.home,
              color: Colors.black,
              size: 40,
            ),
            label: "Asosiy",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.work,
              color: Colors.white,
              size: 40,
            ),
            icon: Icon(
              Icons.list,
              color: Colors.black,
              size: 40,
            ),
            label: "Sartaroshlar",
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.c150B3D.withOpacity(0.5),
              blurRadius: 30,
              spreadRadius: 0,
            ),
          ],
        ),
        child: FloatingActionButton(
          backgroundColor: AppColors.c355353,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const BookingScreen();
            }));
          },
          child: const Icon(
            Icons.bookmarks_outlined,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
