import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.color,
    this.height,
    this.width,
    required this.label,
  });
  final Function()? onPressed;
  final Color? color;
  final double? height;
  final double? width;
  final String label;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Container(
          color: color,
          height: height,
          width: width,
          child: Text(label),
        ));
  }
}
