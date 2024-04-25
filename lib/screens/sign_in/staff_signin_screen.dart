import 'package:flutter/material.dart';

import '../../components/no_account_text.dart';
import '../../components/socal_card.dart';
import 'components/staff_sign_form.dart';

class StaffSignInScreen extends StatelessWidget {
  static String routeName = "/staff_sign_in";

  const StaffSignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đăng nhập"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    "Chào mừng",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Đăng nhập cho nhân viên",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const StaffSignForm(),
                  const SizedBox(height: 16),

                  const SizedBox(height: 20),
                 // const NoAccountText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
