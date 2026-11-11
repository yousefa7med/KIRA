import 'package:flutter/material.dart';

class AppButtons extends StatelessWidget {
  const AppButtons({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,

      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
   
        ),

        child: child,
      ),
    );
  }
}
