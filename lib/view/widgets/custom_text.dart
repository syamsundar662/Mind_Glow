
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.title,
    required this.size,
    required this.fontWeight,
    this.align,
  });
  final String title;
  final double size;
  final FontWeight fontWeight;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: align,
      style: GoogleFonts.poppins(
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
