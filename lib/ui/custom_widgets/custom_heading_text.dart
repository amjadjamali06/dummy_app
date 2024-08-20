import 'package:flutter/material.dart';
import 'package:excise_e_auction/utils/app_colors.dart';

class CustomHeadingText extends StatelessWidget {
  final String text;
  final Color headingColor;

  const CustomHeadingText({super.key, required this.text, this.headingColor=kHeadingGreenColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20,bottom: 20),
      child: Text(text, style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color:headingColor ,
        ),
      ),
    );
  }
}