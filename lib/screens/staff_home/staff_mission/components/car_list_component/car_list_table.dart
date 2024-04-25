import 'package:flutter/material.dart';
import 'package:nhap_mon_cnpm/components/scrollable_widget.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/car_list_component/car_owner.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/car_list_component/text_dialog_widget.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/car_list_component/num_dialog_widget.dart';

class CarListTable extends StatefulWidget {
  const CarListTable({Key? key}) : super(key: key);

  @override
  _CarListTableState createState() => _CarListTableState();
}

class _CarListTableState extends State<CarListTable> {
  List<CarOwner> users = [];
  int stt = 0;

  @override
  void initState() {
    super.initState();
  }

  void addUser() {
    setState(() {
      users.add(
        CarOwner(
          stt: stt++,
          licensePlate: '',
          carBrand: '',
          ownerName: '',
          debt: 0,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 16),
          ScrollableWidget(
            child: buildDataTable(),
          ),
          FloatingActionButton(
            onPressed: addUser,
            child: Text('+'),
          ),
        ],
      ),
    );
  }

  Widget buildDataTable() {
    final columns = ['STT', 'Biển số', 'Hiệu xe', 'Chủ xe', 'Tiền nợ'];

    return DataTable(
      columns: getColumns(columns),
      rows: getRows(users),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      final value = column == columns[4];

      return DataColumn(
        label: Text(column),
        numeric: value,
      );
    }).toList();
  }

  List<DataRow> getRows(List<CarOwner> rows) {
    return rows.map((CarOwner carOwner) => DataRow(
      cells: [
        DataCell(
          Align(
            alignment: Alignment.center,
            child: Text(carOwner.stt.toString()),
          ),
        ),
        DataCell(
          Container(
            constraints: BoxConstraints(maxWidth: 100),
            child: Text(
              carOwner.licensePlate.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          onTap: () {
            editLicensePlate(carOwner);
          },
        ),
        DataCell(
          Container(
            constraints: BoxConstraints(maxWidth: 100),
            child: Text(
              carOwner.carBrand.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          onTap: () {
            editCarBrand(carOwner);
          },
        ),
        DataCell(
          Text(carOwner.ownerName.toString()),
          onTap: () {
            editOwnerName(carOwner);
          },
        ),
        DataCell(
          Text(carOwner.debt.toString()),
          onTap: () {
            editDebt(carOwner);
          },
        )
      ],
    ))
        .toList();
  }

  Future editLicensePlate(CarOwner editUser) async {
    final licensePlate = await showTextDialog(
      context,
      title: 'Nhập biển số',
      value: editUser.licensePlate,
    );

    setState(() => users = users.map((user) {
      final isEditedUser = user == editUser;

      return isEditedUser ? user.copy(licensePlate: licensePlate) : user;
    }).toList());
  }

  Future editCarBrand(CarOwner editUser) async {
    final carBrand = await showTextDialog(
      context,
      title: 'Nhập hiệu xe',
      value: editUser.carBrand,
    );

    setState(() => users = users.map((user) {
      final isEditedUser = user == editUser;

      return isEditedUser ? user.copy(carBrand: carBrand) : user;
    }).toList());
  }

  Future editOwnerName(CarOwner editUser) async {
    final ownerName = await showTextDialog(
      context,
      title: 'Nhập tên chủ xe',
      value: editUser.ownerName,
    );

    setState(() => users = users.map((user) {
      final isEditedUser = user == editUser;

      return isEditedUser ? user.copy(ownerName: ownerName) : user;
    }).toList());
  }

  Future editDebt(CarOwner editUser) async {
    final debt = await showNumDialog(
      context,
      title: 'Nhập tiền nợ',
      value: editUser.debt,
    );

    setState(() => users = users.map((user) {
      final isEditedUser = user == editUser;

      return isEditedUser ? user.copy(debt: debt) : user;
    }).toList());
  }
}