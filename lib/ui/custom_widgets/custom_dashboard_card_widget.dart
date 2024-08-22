import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

class CustomDashboardCardWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final void Function(String) onTap;
  final double? width;
  final double? height;
  final double marginHorizontal;
  final double marginVertical;
  const CustomDashboardCardWidget({super.key, required this.title, required this.iconPath, required this.onTap, this.width, this.height, this.marginHorizontal = 0, this.marginVertical =0});

  @override
  Widget build(BuildContext context) {
    final cardHeight = height ??Get.height * 0.18;
    final cardWidth = width ??Get.height * 0.18;
    return GestureDetector(
      onTap: ()=>onTap(title),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: marginHorizontal, vertical: marginVertical),
        padding: const EdgeInsets.only(top: 20),
        width: cardHeight,
        height: cardWidth,
        decoration: BoxDecoration(
            color: kCardColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 0.5, color: kLightGreyColor,
                  offset: Offset(1, 1)
              )
            ]
        ),
        child: Column(
          children: [
            Expanded(
              // padding: const EdgeInsets.only(left: 8.0),
              child: Image.asset(
                iconPath,
                width: cardHeight * 0.5,
              ),
            ),
            const SizedBox(height: 5,),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  color: kWhiteColor
                ),
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
