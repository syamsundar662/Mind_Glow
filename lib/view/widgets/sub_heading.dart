
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_glow_test/utils/constants.dart';

class SubHeadings extends StatelessWidget {
  const SubHeadings({
    super.key,
    required this.title,
    this.align, this.color,
  });
  final String title;
  final TextAlign? align;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: homeSymmetricPadding,
      child: Text(
        title,
        textAlign: align,
        style: GoogleFonts.poppins(
          fontSize: 22,
           color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}