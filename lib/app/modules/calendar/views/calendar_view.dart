import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/calendar_controller.dart';

class CalendarView extends GetView<CalendarController> {
  const CalendarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CalendarView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CalendarView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
