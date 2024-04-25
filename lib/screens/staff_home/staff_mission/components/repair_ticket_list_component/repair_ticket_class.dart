import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/repair_ticket_component/table_row.dart' as my;

class RepairTicketClass {
  final int stt;
  final String licensePlate;
  final DateTime repairDate;
  List<my.TableRow> rows = [];
  final int tongTien;

   RepairTicketClass({
    required this.stt,
    required this.licensePlate,
    required this.repairDate,
    required this.tongTien,
  });

  RepairTicketClass copy({
    int? stt,
    String? licensePlate,
    DateTime? repairDate,
    int? tongTien
  }) =>
      RepairTicketClass(
        stt: stt ?? this.stt,
        licensePlate: licensePlate ?? this.licensePlate,
        repairDate: repairDate ?? this.repairDate,
        tongTien: tongTien ?? this.tongTien,
      );

  void recieveRows(List<my.TableRow> _rows)
  {
    rows = _rows;
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is RepairTicketClass &&
              runtimeType == other.runtimeType &&
              stt == other.stt &&
              licensePlate == other.licensePlate &&
              repairDate == other.repairDate &&
              rows == other.rows &&
              tongTien == other.tongTien;

  @override
  int get hashCode =>
      stt.hashCode ^ licensePlate.hashCode ^ repairDate.hashCode ^ rows.hashCode ^ tongTien.hashCode;
}