import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:flutter_todo/utils/format_date.dart';

class DateTimePicker extends StatelessWidget {
  final Function controller;
  final Function cancel;
  final String label;
  final DateTime? date;

  const DateTimePicker({
    Key? key,
    required this.controller,
    required this.label,
    required this.cancel,
    this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
          onPressed: () {
            DatePicker.showDatePicker(
              context,
              showTitleActions: true,
              minTime: DateTime.now(),
              theme: const DatePickerTheme(
                backgroundColor: Colors.white,
                itemHeight: 45,
              ),
              onConfirm: (date) {
                controller(date);
              },
            );
          },
          child: const Icon(Icons.calendar_month_outlined),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 24,
            ),
            side: const BorderSide(color: Colors.grey),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            label,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ),
        Text(
          FormatDate.format(date),
          style: const TextStyle(
            fontSize: 16,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 16),
        date != null
            ? GestureDetector(
                onTap: () => cancel(),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  padding: const EdgeInsets.all(6),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
