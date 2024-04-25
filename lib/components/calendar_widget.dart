import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nhap_mon_cnpm/components/form_error.dart';
import 'package:nhap_mon_cnpm/constants.dart';

class CalendarWidget extends StatefulWidget {
  final Function(DateTime?) onSelectedDateChanged;

  const CalendarWidget({Key? key, required this.onSelectedDateChanged})
      : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime? _selectedDate;
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? kDate;

  @override
  void initState() {
    super.initState();
    _controller.text = _selectedDate != null ? DateFormat('yyyy-MM-dd').format(_selectedDate!) : '';
  }
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _controller.text = DateFormat('dd-MM-yyyy').format(_selectedDate!);
      });
      widget.onSelectedDateChanged(_selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kDate);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: klicensePlate);
          return "Hãy nhập ngày";
        }
        return null;
      },
      controller: _controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Chọn ngày',
        hintText: 'Chọn ngày',
        suffixIcon: IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: () {
            _selectDate(context);
          },
        ),
      ),
    );
  }
}