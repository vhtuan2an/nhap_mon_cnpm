import 'package:flutter/material.dart';

import '../../constants.dart';
import '../sign_in/customer_signin_screen.dart';
import '../sign_in/staff_signin_screen.dart';
import 'components/splash_content.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Chào mừng đến với Cars Care, hãy nhấn nút Tiếp tục!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "Chúng tôi mang đến dịch vụ tốt nhất\ndành cho xe của bạn",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "Luôn tận tâm với khách hàng \nHãy cùng bắt đầu nào",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]["image"],
                    text: splashData[index]['text'],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: <Widget>[
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => AnimatedContainer(
                            duration: kAnimationDuration,
                            margin: const EdgeInsets.only(right: 5),
                            height: 6,
                            width: currentPage == index ? 20 : 6,
                            decoration: BoxDecoration(
                              color: currentPage == index
                                  ? kPrimaryColor
                                  : const Color(0xFFD8D8D8),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, CustomerSignInScreen.routeName);
                        },
                        child: const Text("Tiếp tục với tư cách khách hàng"),
                      ),

                      const Spacer(),
                      //const Spacer(flex: 1),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, StaffSignInScreen.routeName);
                        },
                        child: const Text("Tiếp tục với tư cách nhân viên"),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
