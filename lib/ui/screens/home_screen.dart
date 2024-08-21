/* Created By Bilawal Mehmood  on 25-JAN-2024*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/controllers/home_screen_controller.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_scaffold.dart';
import 'package:excise_e_auction/utils/app_colors.dart';
import 'package:excise_e_auction/utils/constants.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      className: runtimeType.toString(),
      screenName: "",
      scaffoldKey: controller.scaffoldKey,
      body: buildBody,
      horizontalPadding: 20,
    );
  }

  Widget get buildBody {
    return Padding(
      padding: EdgeInsets.only(top: Get.height*0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              publicDashboardCard(title: "Programs",shadowColor: const Color(0xff0F663E), iconPath: 'assets/icons/programs.png',onTap: ()=>controller.onHomeCardTap("Programs")),
              const SizedBox(width: 25),
              publicDashboardCard(title: "Check Eligibility",shadowColor: const Color(0xffFF722C),iconPath: 'assets/icons/check_eligbility.png',onTap: ()=>controller.onHomeCardTap("Check Eligibility")),
            ]
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [ 
              publicDashboardCard(title: "Registration",shadowColor: const Color(0xff0566B1),iconPath: 'assets/icons/registration.png',onTap: ()=>controller.onHomeCardTap("Registration")),
              const SizedBox(width: 25),
              publicDashboardCard(title: "Complaints",shadowColor: const Color(0xff1FB2BC),iconPath: 'assets/icons/complaints.png',onTap: ()=>controller.onHomeCardTap("Complaints")),],
          ),
          SizedBox(height: Get.height*0.1),
          homeButton(),
        ],
      ),
    );
  }

   Widget publicDashboardCard({String title="Title",Color shadowColor=Colors.purple, String iconPath='assets/icons/programs.png', required Function() onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              height: 160,
              decoration: BoxDecoration(color: const Color(0xffF4F3FF),borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: shadowColor,blurRadius: 0,offset: const Offset(15, 15))]),
              margin: const EdgeInsets.only(right: 15,top: 20),
              padding: const EdgeInsets.all(15),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),
                boxShadow:  const [BoxShadow(color: Colors.black12,blurRadius: 10,offset: Offset(0, 10))]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(iconPath,height: 60,width: 60),
                    const SizedBox(height: 10),
                    Text(title,textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,
                      style:  const TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Color(0xff5B5B5B)))
                  ],
                ),
              ),
            ),
            Container(
              height: 25,
              width: 3,
              color: shadowColor,
            ),
            Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: shadowColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector homeButton() {
    return GestureDetector(
      onTap: ()=>Get.toNamed(kLoginScreenRoute),
      child: Container(width: double.infinity, height: 54, padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xff352C7B),
                Color(0xff0F9C4D),
              ],
            ),
          ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/lock_icon.png'),
            const SizedBox(width: 5),
            const Text(
              "Employer Login",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: kWhiteColor,
              ),
            ),
          ],
        )
      ),
    );
  }
}
