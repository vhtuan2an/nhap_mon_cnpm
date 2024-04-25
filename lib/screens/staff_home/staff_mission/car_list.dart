import 'package:flutter/material.dart';

import 'package:nhap_mon_cnpm/constants.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/car_list_component/car_list_table.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/repair_ticket_component/table.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/repair_ticket_component/infor.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/repair_ticket_component/checkout_card.dart';
import 'components/repair_register_component/vehicle_repair_form.dart';

class CarList extends StatelessWidget {
  static String routeName = "/car_list";

  const CarList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tạo phiếu sửa chữa mới'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Danh sách các xe", style: headingStyle),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: double.infinity),
              child: CarListTable(),
            ),
          ],
        ),
      ),
    );
  }
}