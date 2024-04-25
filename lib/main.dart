import 'package:flutter/material.dart';
import 'package:nhap_mon_cnpm/screens/splash/splash_screen.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_home_screen.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/car_list.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/repair_ticket.dart';import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/vehicle_repair.dart';

import 'routes.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Flutter Way - Template',
      theme: AppTheme.lightTheme(context),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
