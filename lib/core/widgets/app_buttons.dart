import 'package:flutter/material.dart';

class AppButtons extends StatelessWidget {
  const AppButtons({
    super.key,
    required this.child,
    required this.onPressed,
    this.isLoading = false,
  });
  final Widget child;
  final void Function()? onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,

      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(strokeWidth: 3),
              )
            : child,
      ),
    );
  }
}
