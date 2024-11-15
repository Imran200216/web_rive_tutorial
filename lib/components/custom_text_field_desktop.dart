import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFieldDesktop extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final IconButton? iconButton;
  final bool obscureText; // Add obscureText property

  const CustomTextFieldDesktop({
    super.key,
    this.hintText = "Enter text", // Default hint text if not provided
    this.keyboardType = TextInputType.text, // Default keyboard type
    this.controller,
    this.focusNode,
    this.iconButton, // Optional suffix icon
    this.obscureText = false, // Default value for obscureText
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        style: GoogleFonts.poppins(
          color: Colors.white,
        ),
        focusNode: focusNode,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        // Apply obscureText
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF3B374D),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(color: Colors.grey),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          suffixIcon: iconButton,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
        ),
      ),
    );
  }
}
