import 'package:flutter/material.dart';
import 'package:staffhub/core/app_color.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      height: 50,

      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: theme.bodyMedium?.copyWith(
            fontSize: 25,
            color: const Color.fromARGB(255, 125, 125, 125),
          ),
        ),
        style: ElevatedButton.styleFrom(
          splashFactory: InkSplash.splashFactory,

          shadowColor: AppColor.textDark,
          backgroundColor: AppColor.orange,
          elevation: 6,
        ),
      ),
    );
  }
}
