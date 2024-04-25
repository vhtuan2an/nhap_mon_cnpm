//import 'dart:js';

import 'package:flutter/widgets.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/money_repair_component/complete_money_repair_screen.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/repair_register_component/complete_repair_register_screen.dart';
import 'package:nhap_mon_cnpm/screens/products/products_screen.dart';
import 'package:nhap_mon_cnpm/screens/sign_up_success/sign_up_success_screen.dart';
import 'package:nhap_mon_cnpm/screens/home_page/home_page_screen.dart';

import 'package:nhap_mon_cnpm/screens/customer_home/customer_home_screen.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_home_screen.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/repair_ticket_list_component/list.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/repair_ticket_list_component/repair_ticket_class.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/vehicle_repair.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/money_repair.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/repair_ticket.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/car_list.dart';

import 'screens/cart/cart_screen.dart';
import 'screens/complete_profile/complete_profile_screen.dart';
import 'screens/details/details_screen.dart';
import 'screens/forgot_password/forgot_password_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/init_screen.dart';
import 'screens/login_success/login_success_screen.dart';
import 'screens/otp/otp_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/sign_in/customer_signin_screen.dart';
import 'screens/sign_in/staff_signin_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/staff_home/staff_mission/components/repair_register_component/complete_repair_register_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  InitScreen.routeName: (context) => const InitScreen(),

  SplashScreen.routeName: (context) => const SplashScreen(),
  CustomerSignInScreen.routeName: (context) => const CustomerSignInScreen(),
  StaffSignInScreen.routeName: (context) => const StaffSignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  VehicleRepair.routeName: (context) => const VehicleRepair(),

  MoneyRepair.routeName: (context) => const MoneyRepair(),
  RepairTicket.routeName: (context) => const RepairTicket(),
  CarList.routeName: (context) => const CarList(),
  // OtpScreen.routeName: (context) => const OtpScreen(),
  CustomerHomeScreen.routeName: (context) => const CustomerHomeScreen(),
  StaffHomeScreen.routeName: (context) => const StaffHomeScreen(),
  ProductsScreen.routeName: (context) => const ProductsScreen(),
  DetailsScreen.routeName: (context) => const DetailsScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  SignUpSucessScreen.routeName: (context) => const SignUpSucessScreen(),
  CompleteRepairRegisterScreen.routeName: (context) => const CompleteRepairRegisterScreen(),
  CompleteMoneyRepairScreen.routeName: (context) => const CompleteMoneyRepairScreen(),
};
