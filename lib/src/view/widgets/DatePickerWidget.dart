import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {
  final Function(String) onDateSelected;

  const DatePickerWidget({Key? key, required this.onDateSelected}) : super(key: key);

  @override
  _DatePickerDialogState createState() => _DatePickerDialogState();
}

class _DatePickerDialogState extends State<DatePickerWidget> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });

      final String formattedDate = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
      widget.onDateSelected(formattedDate);

      // Close the dialog
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Date'),
      content: SizedBox(
        height: 200, // Adjust height as needed for the date picker
        child: ElevatedButton(
          onPressed: () => _selectDate(context),
          child: Text('Choose Date'),
        ),
      ),
    );
  }
}
