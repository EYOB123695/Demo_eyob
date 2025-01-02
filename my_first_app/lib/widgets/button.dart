import 'package:flutter/material.dart';

class ButtonOne extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double width; // Width of the button
  final double height; // Height of the button

  const ButtonOne({
    Key? key,
    required this.label,
    required this.onPressed,
    this.width = double.infinity, // Default width spans the available space
    this.height = 48.0, // Default height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green, // Button color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Rounded corners
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white, // Text color
            fontSize: 16, // Font size
          ),
        ),
      ),
    );
  }
}
