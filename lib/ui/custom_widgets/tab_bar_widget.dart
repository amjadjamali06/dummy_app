import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class TabBarCard extends StatelessWidget {
  final String title;
  final bool isSelected;
  final void Function() onTap;
  const TabBarCard({super.key, required this.title, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 4),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration:isSelected? BoxDecoration(
            color: kPrimaryDarkColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: kPrimaryColor),
            boxShadow: const [
              BoxShadow(
                color: Colors.white60,
                offset: Offset(0, 1),
                blurRadius: 1,
                spreadRadius: 0.5,
              )
            ]
        ):null,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}