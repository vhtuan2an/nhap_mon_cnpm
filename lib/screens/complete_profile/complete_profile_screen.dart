import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/complete_profile_form.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile";

  const CompleteProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng ký'),
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
                  const Text("Hoàn tất hồ sơ", style: headingStyle),
                  const Text(
                    "Hoàn tất thông tin của bạn",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const CompleteProfileForm(),
                  const SizedBox(height: 30),
                  Text(
                    "Khi nhấn Tiếp tục, bạn đã đồng ý \nvới các Điều khoản gì gì đó",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
