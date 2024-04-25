import 'package:flutter/material.dart';
import 'package:nhap_mon_cnpm/screens/home_page/components/name_card.dart';
import 'package:nhap_mon_cnpm/screens/init_screen.dart';

class HomePageScreen extends StatelessWidget {
  static String routeName = "/home_page";

  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              NameCard(),
              SizedBox(height: 20),
            ],
           ),
          )

        ),
      ),
    );
  }
}