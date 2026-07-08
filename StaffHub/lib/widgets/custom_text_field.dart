import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  const CustomTextField({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return TextField(
      // controller: c,
      decoration: InputDecoration(
        filled: true,

        labelText: title,
        fillColor: Theme.of(context).colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 2, color: Colors.grey),
        ),
      ),
    );
  }
}
