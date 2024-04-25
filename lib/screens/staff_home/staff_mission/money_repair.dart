import 'package:flutter/material.dart';

import 'package:nhap_mon_cnpm/constants.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/money_repair_component/repair_money_form.dart';
import 'components/repair_register_component/vehicle_repair_form.dart';

class MoneyRepair extends StatelessWidget {
  static String routeName = "/money_repair";

  const MoneyRepair({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phiếu thu tiền'),
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
                  const Text("Thanh toán", style: headingStyle),
                  const Text(
                    "Hoàn tất thông tin của bạn",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const RepairMoneyForm(),
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
