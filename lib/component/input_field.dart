import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final int? maxLines;
  final bool isRequired;
  final bool isError;
  final Function(String)? onChange;

  const InputField({
    Key? key,
    this.controller,
    required this.label,
    this.maxLines,
    this.isRequired = false,
    this.isError = false,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines ?? 1,
      onChanged: onChange,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        errorText: isRequired && isError ? '$label is required' : null,
      ),
    );
  }
}
