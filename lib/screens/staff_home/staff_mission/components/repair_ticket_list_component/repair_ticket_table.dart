import 'package:flutter/material.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/repair_ticket_component/table_row.dart' as my;
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/repair_ticket_component/scrollable_widget.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/repair_ticket_component/text_dialog_widget.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/repair_ticket_component/num_dialog_widget.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/repair_ticket_component/checkout_card.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/repair_ticket_list_component/list.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/repair_ticket_list_component/repair_ticket_class.dart' as my;
import 'package:nhap_mon_cnpm/screens/staff_home/staff_home_screen.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/repair_ticket.dart';

class TableForm extends StatefulWidget {
  final my.RepairTicketClass repairTicket;

  const TableForm({Key? key, required this.repairTicket});
  @override
  _TableFormState createState() => _TableFormState();
}


class _TableFormState extends State<TableForm> {
  int stt = 1;
  int tongTien = 0;
  List<my.TableRow> rows = [];


  @override
  void initState() {
    super.initState();
  }

  void sendToRepairTicketList(List<my.TableRow> _rows)
  {
    widget.repairTicket.recieveRows(_rows);
  }

  void addRow() {
    setState(() {
      rows.add(my.TableRow(
        stt: stt++,
        noiDung: '',
        vatTu: '',
        sl: 0,
        donGia: 0,
        tienCong: 0,
        thanhTien: 0,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: 300,
              width: 400,
              child: Stack(
                children: [
                  ScrollableWidget(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: buildTable(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: FloatingActionButton(
                        onPressed: addRow,
                        child: Text('+'),
                      ),
                    ),
                  ),
                ],
              )

          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: checkoutCard(
              value: tongTien,
            ),
          )
        ],
      ),
    );
  }

  Widget buildTable() {
    final columns =['STT', 'Nội dung', 'Vật tư, phụ tùng', 'Số lượng', 'Đơn giá', 'Tiền công', 'Thành tiền'];
    return DataTable(
      columns: getColumns(columns),
      rows: getRows(rows),
    );
  }

  @override
  void dispose() {
    // Gửi danh sách các hàng khi _TableFormState bị huỷ
    sendToRepairTicketList(rows);
    super.dispose();
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      final value = column == columns[6];

      return DataColumn(
        label: Text(column),
        numeric: value,
      );
    }).toList();
  }

  List<DataRow> getRows(List<my.TableRow> rows) {
    return rows.map((my.TableRow tableRow) => DataRow(
      cells: [
        DataCell(
            Align(
              alignment: Alignment.center,
              child: Text(tableRow.stt.toString()),
            )
        ),
        DataCell(
            Container(
              constraints: BoxConstraints(maxWidth: 100),
              child: Text(
                tableRow.noiDung.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () {
              editNoiDung(tableRow);
            }
        ),
        DataCell(
            Container(
              constraints: BoxConstraints(maxWidth: 100),
              child: Text(
                tableRow.vatTu.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () {
              editVatTu(tableRow);
            }
        ),
        DataCell(
            Text(tableRow.sl.toString()),
            onTap: () {
              editSL(tableRow);
            }
        ),
        DataCell(
            Text(tableRow.donGia.toString()),
            onTap: () {
              editDonGia(tableRow);
            }
        ),
        DataCell(
            Text(tableRow.tienCong.toString()),
            onTap: () {
              editTienCong(tableRow);
            }
        ),
        DataCell(
          Text(tableRow.thanhTien.toString()),
        ),
      ],
    )).toList();
  }

  Future editNoiDung(my.TableRow edit) async {
    final noiDung = await showTextDialog(
      context,
      title: 'Nhập nội dung',
      value: edit.noiDung,
    );

    setState(() => rows = rows.map((tableRow) {
      final isEditedRow = tableRow == edit;

      return isEditedRow ? tableRow.copy(noiDung: noiDung) : tableRow;
    }).toList());
  }

  Future editVatTu(my.TableRow edit) async {
    final vatTu = await showTextDialog(
      context,
      title: 'Nhập vật tư',
      value: edit.vatTu,
    );

    setState(() => rows = rows.map((tableRow) {
      final isEditedRow = tableRow == edit;

      return isEditedRow ? tableRow.copy(vatTu: vatTu) : tableRow;
    }).toList());
  }

  Future editSL(my.TableRow edit) async {
    final sl = await showNumDialog(
      context,
      title: 'Nhập số lượng',
      value: edit.sl,
    );

    setState(() => rows = rows.map((tableRow) {
      final isEditedRow = tableRow == edit;
      if (isEditedRow) {
        tableRow = tableRow.copy(sl: sl);
        tableRow = tableRow.copy(thanhTien: tableRow.updateThanhTien());
        tongTien += tableRow.thanhTien;
      }
      return tableRow;
    }).toList());
  }

  Future editDonGia(my.TableRow edit) async {
    final donGia = await showNumDialog(
      context,
      title: 'Nhập đơn giá',
      value: edit.donGia,
    );

    setState(() => rows = rows.map((tableRow) {
      final isEditedRow = tableRow == edit;
      if (isEditedRow) {
        tableRow = tableRow.copy(donGia: donGia);
        tableRow = tableRow.copy(thanhTien: tableRow.updateThanhTien());
        tongTien += tableRow.thanhTien;
      }
      return tableRow;
    }).toList());
  }

  Future editTienCong(my.TableRow edit) async {
    final tienCong = await showNumDialog(
      context,
      title: 'Nhập tiền công',
      value: edit.tienCong,
    );

    setState(() => rows = rows.map((tableRow) {
      final isEditedRow = tableRow == edit;
      if (isEditedRow) {
        tableRow = tableRow.copy(tienCong: tienCong);
        tableRow = tableRow.copy(thanhTien: tableRow.updateThanhTien());
        tongTien += tableRow.thanhTien;
      }
      return tableRow;
    }).toList());

  }


}

