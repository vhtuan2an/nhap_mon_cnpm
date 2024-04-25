import 'package:flutter/material.dart';
import 'package:nhap_mon_cnpm/screens/init_screen.dart';
import 'package:nhap_mon_cnpm/screens/sign_in/customer_signin_screen.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_home_screen.dart';

class SignUpSucessScreen extends StatelessWidget {
  static String routeName = "/signup_success";

  const SignUpSucessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("Đăng ký thành công"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Image.asset(
            "assets/images/success.png",
            height: MediaQuery.of(context).size.height * 0.4, //40%
          ),
          const SizedBox(height: 16),
          const Text(
            "Đăng ký thành công",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, StaffHomeScreen.routeName);
              },
              child: const Text("Trở về Trang chủ"),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
