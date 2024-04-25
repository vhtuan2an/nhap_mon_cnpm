import 'package:flutter/material.dart';
import 'package:nhap_mon_cnpm/components/form_error.dart';
import 'package:nhap_mon_cnpm/components/calendar_widget.dart';
import 'package:nhap_mon_cnpm/constants.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_home_screen.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/repair_ticket_component/table.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/repair_ticket_component/checkout_card.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/repair_ticket_list_component/repair_ticket_class.dart';

class InforForm extends StatefulWidget {

  const InforForm({super.key});

  @override
  _InforFormState createState() => _InforFormState();
}

class _InforFormState extends State<InforForm> {
  final _formKey = GlobalKey<FormState>();
  final int tongTien = 0;
  final List<String?> errors = [];
  String? licensePlate;
  DateTime? repairDay;

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
          Column(
            children: [
              TextFormField(
                onSaved: (newValue) => licensePlate = newValue,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    removeError(error: klicensePlate);
                  }
                  return;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    addError(error: klicensePlate);
                    return "Hãy nhập biển số xe";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "Biển số xe",
                  hintText: "Nhập biển số xe",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              const SizedBox(height: 20),
              CalendarWidget(
                onSelectedDateChanged: (DateTime? selectedDate) {
                  setState(() {
                    repairDay = selectedDate;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 400,
              width: 400,
              child: Stack(
                children: [
                  TableForm(),
                  Positioned(
                    bottom: 15,
                    right: 0,
                    child: Container(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (errors.isEmpty) {
                              Navigator.pushNamed(
                                  context, StaffHomeScreen.routeName);
                            }
                          }
                        },
                        child: const Text("Hoàn thành"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}