// import 'package:flutter/material.dart';
//
// class BookingScreen extends StatefulWidget {
//   @override
//   _BookingScreenState createState() => _BookingScreenState();
// }
//
// class _BookingScreenState extends State<BookingScreen> {
//   DateTime? selectedDate;
//   List<String> availableTimes = ["09:00", "10:00", "11:00", "14:00", "15:00"];
//   List<String> bookedTimes = [];
//
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2030),
//     );
//     if (pickedDate != null && pickedDate != selectedDate) {
//       setState(() {
//         selectedDate = pickedDate;
//       });
//     }
//   }
//
//   void _bookTime(String time) {
//     setState(() {
//       bookedTimes.add(time);
//     });
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text("Time $time has been booked!"),
//     ));
//   }
//
//   void _cancelBooking(String time) {
//     setState(() {
//       bookedTimes.remove(time);
//     });
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text("Booking for $time has been canceled!"),
//     ));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Booking Screen")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: () => _selectDate(context),
//               child: Text(
//                 selectedDate == null
//                     ? "Select Date"
//                     : "Selected: ${selectedDate!.toLocal()}".split(' ')[0],
//               ),
//             ),
//             SizedBox(height: 20),
//             selectedDate != null
//                 ? Expanded(
//                     child: ListView.builder(
//                       itemCount: availableTimes.length,
//                       itemBuilder: (context, index) {
//                         String time = availableTimes[index];
//                         bool isBooked = bookedTimes.contains(time);
//                         return ListTile(
//                           title: Text(time),
//                           trailing: isBooked
//                               ? Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     const Text(
//                                       "Booked",
//                                       style: TextStyle(color: Colors.red),
//                                     ),
//                                     IconButton(
//                                       icon: Icon(Icons.cancel),
//                                       color: Colors.red,
//                                       onPressed: () {
//                                         _cancelBooking(time);
//                                       },
//                                     ),
//                                   ],
//                                 )
//                               : ElevatedButton(
//                                   onPressed: () {
//                                     if (!isBooked) {
//                                       _bookTime(time);
//                                     }
//                                   },
//                                   child: const Text("Book"),
//                                 ),
//                         );
//                       },
//                     ),
//                   )
//                 : Container(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class DailyScheduleScreen extends StatefulWidget {
//   final DateTime selectedDate;
//
//   const DailyScheduleScreen({Key? key, required this.selectedDate})
//       : super(key: key);
//
//   @override
//   _DailyScheduleScreenState createState() => _DailyScheduleScreenState();
// }
//
// class _DailyScheduleScreenState extends State<DailyScheduleScreen> {
//   List<TimeOfDay> availableTimes = [];
//   List<TimeOfDay> bookedTimes = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadTimes();
//   }
//
//   void _loadTimes() {
//     TimeOfDay startTime = const TimeOfDay(hour: 9, minute: 0);
//     TimeOfDay endTime = const TimeOfDay(hour: 18, minute: 0);
//     availableTimes =
//         _getTimeSlots(startTime, endTime, const Duration(minutes: 30));
//
//     bookedTimes = [
//       const TimeOfDay(hour: 10, minute: 0),
//       const TimeOfDay(hour: 14, minute: 30),
//       const TimeOfDay(hour: 16, minute: 0),
//     ];
//
//     availableTimes.removeWhere((time) => bookedTimes.contains(time));
//   }
//
//   List<TimeOfDay> _getTimeSlots(
//       TimeOfDay startTime, TimeOfDay endTime, Duration interval) {
//     List<TimeOfDay> slots = [];
//     int totalMinutes = (endTime.hour * 60 + endTime.minute) -
//         (startTime.hour * 60 + startTime.minute);
//     int slotCount = totalMinutes ~/ interval.inMinutes;
//
//     for (int i = 0; i <= slotCount; i++) {
//       int minutes =
//           startTime.hour * 60 + startTime.minute + (interval.inMinutes * i);
//       slots.add(TimeOfDay(hour: minutes ~/ 60, minute: minutes % 60));
//     }
//
//     return slots;
//   }
//
//   void _bookTime(TimeOfDay time) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//             'Booked ${time.format(context)} on ${widget.selectedDate.toLocal().toString().split(' ')[0]}!'),
//       ),
//     );
//
//     setState(() {
//       availableTimes.remove(time);
//       bookedTimes.add(time);
//     });
//   }
//
//   void _cancelBooking(TimeOfDay time) {
//     setState(() {
//       bookedTimes.remove(time);
//       availableTimes.add(time);
//       availableTimes
//           .sort((a, b) => a.hour * 60 + a.minute - (b.hour * 60 + b.minute));
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Booking for ${time.format(context)} has been canceled!'),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//             '${widget.selectedDate.toLocal().toString().split(' ')[0]} Schedule'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: availableTimes.isNotEmpty
//             ? ListView.builder(
//                 itemCount: availableTimes.length,
//                 itemBuilder: (context, index) {
//                   TimeOfDay time = availableTimes[index];
//                   return ListTile(
//                     title: Text(time.format(context)),
//                     trailing: ElevatedButton(
//                       onPressed: () => _bookTime(time),
//                       child: const Text('Book'),
//                     ),
//                   );
//                 },
//               )
//             : const Center(
//                 child: Text('No available times for this day.'),
//               ),
//       ),
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Sanani formatlash uchun kutubxona

class BookingScreen extends StatefulWidget {
  final DateTime? initialDate;

  const BookingScreen({Key? key, this.initialDate}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? selectedDate;
  List<String> availableTimes = [
    "09:00",
    "10:00",
    "11:00",
    "14:00",
    "15:00",
    "16:00",
    "17:00",
    "18:00"
  ];
  Map<DateTime, List<String>> bookedSchedule =
      {}; // Sanalar va band qilingan vaqtlar

  @override
  void initState() {
    super.initState();
    // Agar initialDate berilgan bo'lsa, uni tanlangan sana sifatida o'rnating
    if (widget.initialDate != null) {
      selectedDate = widget.initialDate;
      if (!bookedSchedule.containsKey(selectedDate)) {
        bookedSchedule[selectedDate!] = [];
      }
    } else {
      selectedDate = DateTime.now(); // Hozirgi sanani tanlang
      bookedSchedule[selectedDate!] =
          []; // Hozirgi sanaga yangi ro'yxat yarating
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate!,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        // Tanlangan sananing band qilingan vaqtlarini olish
        if (!bookedSchedule.containsKey(selectedDate)) {
          bookedSchedule[selectedDate!] =
              []; // Agar band qilingan vaqtlar yo'q bo'lsa, yangi ro'yxat yaratamiz
        }
      });
    }
  }

  void _bookTime(String time) {
    setState(() {
      bookedSchedule[selectedDate!]!.add(time);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Time $time has been booked!"),
    ));
  }

  void _cancelBooking(String time) {
    setState(() {
      bookedSchedule[selectedDate!]!.remove(time);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Booking for $time has been canceled!"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // Sana va kunni formatlash
    String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
    String dayOfWeek = DateFormat('EEEE').format(selectedDate!); // Kun

    return Scaffold(
      appBar: AppBar(title: Text("Booking Screen")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Sana va kunni ko'rsatish
            Text(
              "Selected Date: $formattedDate\nDay: $dayOfWeek",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text(
                "Change Date",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: availableTimes.length,
                itemBuilder: (context, index) {
                  String time = availableTimes[index];
                  bool isBooked = bookedSchedule[selectedDate]!.contains(time);
                  return ListTile(
                    title: Text(time),
                    trailing: isBooked
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "Booked",
                                style: TextStyle(color: Colors.red),
                              ),
                              IconButton(
                                icon: Icon(Icons.cancel),
                                color: Colors.red,
                                onPressed: () {
                                  _cancelBooking(time);
                                },
                              ),
                            ],
                          )
                        : ElevatedButton(
                            onPressed: () {
                              if (!isBooked) {
                                _bookTime(time);
                              }
                            },
                            child: const Text(
                              "Book",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
