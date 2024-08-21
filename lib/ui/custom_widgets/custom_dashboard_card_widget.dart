import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

class CustomDashboardCardWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final void Function() onTap;
  const CustomDashboardCardWidget({super.key, required this.title, required this.iconPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          padding: const EdgeInsets.only(top: 25),
          width: Get.width * 0.45,
          height: 140,
          decoration: BoxDecoration(
              color: kWhiteColor,
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
                  width: 60,
                ),
              ),
              const SizedBox(height: 5,),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
