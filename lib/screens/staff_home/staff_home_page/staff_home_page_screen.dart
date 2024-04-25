import 'package:flutter/material.dart';
import 'package:nhap_mon_cnpm/screens/home_page/components/name_card.dart';
import 'package:nhap_mon_cnpm/screens/home_page/home_page_screen.dart';
import 'package:nhap_mon_cnpm/screens/init_screen.dart';
import 'package:nhap_mon_cnpm/screens/sign_up/sign_up_screen.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/car_list.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/money_repair.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/repair_ticket.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/vehicle_repair.dart';
import '../../../constants.dart';


class StaffHomePageScreen extends StatelessWidget {
  static String routeName = "/staff_home_page";

  const StaffHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              NameCard(),
              SizedBox(height: 30),
              Container(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, VehicleRepair.routeName);
                  },
                  child: Text('Lập phiếu tiếp nhận'),
                )
              ),
              SizedBox(height: 30),
              Container(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MoneyRepair.routeName);
                    },
                    child: Text('Lập phiếu thu tiền'),
                  )
              ),
              SizedBox(height: 30),
              Container(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, CarList.routeName);
                    },
                    child: Text('Danh sách các xe'),
                  )
              ),

              SizedBox(height: 20),
              Container(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, RepairTicketList.routeName);
                    },
                    child: Text('Xem các phiếu sửa chữa'),
                  )
              ),
              SizedBox(height: 20),
              Container(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RepairTicket.routeName);
                    },
                    child: Text('Lập phiếu sửa chữa mới'),
                  )
              ),
            ],
           ),
          )

        ),
      ),
    );
  }
}