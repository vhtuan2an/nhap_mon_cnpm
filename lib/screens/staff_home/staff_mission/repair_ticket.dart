import 'package:flutter/material.dart';

import 'package:nhap_mon_cnpm/constants.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/repair_ticket_component/table.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/repair_ticket_component/infor.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/repair_ticket_component/checkout_card.dart';
import 'components/repair_register_component/vehicle_repair_form.dart';

class RepairTicket extends StatelessWidget {
  static String routeName = "/repair_ticket";

  const RepairTicket({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tạo phiếu sửa chữa mới'),
      ),
      body: const SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text("Phiếu sửa chữa", style: headingStyle),

                  const SizedBox(height: 16),
                  InforForm(),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}