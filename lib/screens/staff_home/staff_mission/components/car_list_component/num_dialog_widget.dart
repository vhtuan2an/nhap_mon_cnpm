import 'package:flutter/material.dart';
import 'package:nhap_mon_cnpm/screens/staff_home/staff_mission/components/repair_ticket_component/table.dart';

Future<T?> showNumDialog<T>(
    BuildContext context, {
      required String title,
      required int value,
    }) =>
    showDialog<T>(
      context: context,
      builder: (context) => NumDialogWidget(
        title: title,
        value: value,
      ),
    );

class NumDialogWidget extends StatefulWidget {
  final String title;
  final int value;

  const NumDialogWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  _NumDialogWidgetState createState() => _NumDialogWidgetState();
}

class _NumDialogWidgetState extends State<NumDialogWidget> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.value.toString());
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(widget.title),
    content: TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Hãy nhập số';
        }
        return null;
      },
    ),
    actions: [
      ElevatedButton(
        child: Text('Xong'),
        onPressed: () {
          if (controller.text.isNotEmpty) {
            final intValue = int.tryParse(controller.text);
            if (intValue != null) {
              Navigator.of(context).pop(intValue);
            }
          }
        },
      ),
    ],
  );
}