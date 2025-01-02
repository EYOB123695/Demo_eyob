import 'package:flutter/material.dart';

class CustomLogoButton extends StatelessWidget {
  final String logoPath; // Image asset path for the logo
  final Color backgroundColor; // Button background color
  final VoidCallback onPressed; // Function to handle button press
  final double? width; // Optional width
  final double? height; // Optional height

  const CustomLogoButton({
    Key? key,
    required this.logoPath, // Provide logoPath instead of icon
    required this.backgroundColor,
    required this.onPressed,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        side: BorderSide(color: Colors.grey), // Add grey border
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.all(12.0),
        minimumSize: Size(width ?? 48.0, height ?? 48.0), // Set size
      ),
      child: Image.asset(
        logoPath, // Load the logo image
        height: height ?? 24.0,
        width: width ?? 24.0,
        fit: BoxFit.contain,
      ),
    );
  }
}
