import 'package:flutter/material.dart';

class BaseDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onOk;
  final Color backgroundColor;
  final double elevation;

  const BaseDialog({
    Key? key,
    required this.title,
    required this.message,
    this.onOk,
    this.backgroundColor = Colors.white,
    this.elevation = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 16),
            Text(
              message,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            if (onOk != null)
              ElevatedButton(
                onPressed: () {
                  onOk!.call();
                  Navigator.of(context).pop();  // Dismiss the dialog automatically on OK
                },
                child: Text('OK'),
              ),
          ],
        ),
      ),
    );
  }
}