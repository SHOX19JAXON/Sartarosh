import 'package:flutter/material.dart';
import 'package:sartarosh/utils/colors/app_colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(10, (i) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.c355353,
                ),
                width: double.infinity,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "Ertaga soat 14:00 da chilonzor filiyalda sizga joy band qilingan",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
