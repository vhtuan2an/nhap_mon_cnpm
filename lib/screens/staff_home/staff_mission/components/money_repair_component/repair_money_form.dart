import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nhap_mon_cnpm/screens/home/home_screen.dart';
import 'package:nhap_mon_cnpm/screens/sign_in/customer_signin_screen.dart';
import 'package:nhap_mon_cnpm/screens/sign_up_success/sign_up_success_screen.dart';
import 'package:nhap_mon_cnpm/constants.dart';
import 'package:nhap_mon_cnpm/components/form_error.dart';
import 'package:nhap_mon_cnpm/components/calendar_widget.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/money_repair_component/complete_money_repair_screen.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/repair_register_component/complete_repair_register_screen.dart'; // Add this import statement

class RepairMoneyForm extends StatefulWidget {
  const RepairMoneyForm({super.key});

  @override
  _RepairMoneyFormState createState() => _RepairMoneyFormState();
}

class _RepairMoneyFormState extends State<RepairMoneyForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  String? licensePlate;
  String? brand;
  DateTime? recieveDay;

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            onSaved: (newValue) => firstName = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kNamelNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kNamelNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Họ",
              hintText: "Nhập họ của bạn",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            onSaved: (newValue) => lastName = newValue,
            decoration: const InputDecoration(
              labelText: "Tên",
              hintText: "Nhập tên của bạn",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.phone,
            onSaved: (newValue) => phoneNumber = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPhoneNumberNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kPhoneNumberNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Số điện thoại",
              hintText: "Nhập số điện thoại",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            onSaved: (newValue) => address = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kAddressNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kAddressNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Địa chỉ",
              hintText: "Nhập địa chỉ",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            onSaved: (newValue) => licensePlate = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kAddressNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kAddressNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Số tiền",
              hintText: "Nhập số tiền đã thu",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          const SizedBox(height: 20),
          CalendarWidget(
            onSelectedDateChanged: (DateTime? selectedDate) {
              setState(() {
                recieveDay = selectedDate;
              });
            },
          ),
          FormError(errors: errors),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, CompleteMoneyRepairScreen.routeName);
              }
            },
            child: const Text("Tiếp tục"),
          ),
        ],
      ),
    );
  }
}