import 'package:flutter/material.dart';
import 'repair_ticket_class.dart';

class RepairTicket_List extends StatefulWidget {
  @override
  _RepairTicket_ListState createState() => _RepairTicket_ListState();
}
class _RepairTicket_ListState extends State<RepairTicket_List> {
  late final List<RepairTicketClass> repairTickets;
@override
  void initState()
  {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: repairTickets.length,
      itemBuilder: (context, index) {
        final repairTicket = repairTickets[index];
        return Card(
          child: ListTile(
            title: Text('Biển số xe: ${repairTicket.licensePlate}'),
            subtitle: Text('Ngày: ${repairTicket.repairDate.toString()}'),
          ),
        );
      },
    );
  }
}