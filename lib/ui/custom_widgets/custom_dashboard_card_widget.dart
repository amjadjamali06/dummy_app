import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';

class CustomDashboardCardWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final void Function(String) onTap;
  final double width;
  final double height;
  final double marginHorizontal;
  final double marginVertical;
  const CustomDashboardCardWidget({super.key, required this.title, required this.iconPath, required this.onTap, this.width = 140, this.height = 100, this.marginHorizontal = 0, this.marginVertical =0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onTap(title),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: marginHorizontal, vertical: marginVertical),
            width: Get.width*0.38,
            height: 120,
            decoration: BoxDecoration(
                color: kCardColor,
                borderRadius: BorderRadius.circular(22),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 5,
                      // spreadRadius: 1,
                      color: kCardShadowColor,
                      offset: Offset(2, 2)
                  )
                ]
            ),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    iconPath,
                    width: 60,
                  ),
                ),

              ],
            ),
          ),
          const SizedBox(height: 5,),
          Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 15,
                color: kTextColor
            ),
            overflow: TextOverflow.clip,
          ),
        ],
      ),
    );
  }
}
