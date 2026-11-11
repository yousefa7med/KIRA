import 'package:flutter/material.dart';

class AppButtons extends StatelessWidget {
  const AppButtons({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,

      child: ElevatedButton(onPressed: () {}, child: child),
    );
  }
}
