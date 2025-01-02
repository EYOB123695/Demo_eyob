import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  final bool isActive;

  const SignInButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
            color: isActive ? Colors.green : Colors.grey, width: 0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        backgroundColor: isActive ? Colors.green : Colors.white,
        foregroundColor: isActive ? Colors.white : Colors.grey,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 10),
          Text(
            text,
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }
}
