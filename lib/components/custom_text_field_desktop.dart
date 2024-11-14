import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFieldDesktop extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  const CustomTextFieldDesktop({
    super.key,
    this.hintText = "Enter text", // Default hint text if not provided
    this.keyboardType = TextInputType.text, // Default keyboard type
    this.controller, // Optional controller
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
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
