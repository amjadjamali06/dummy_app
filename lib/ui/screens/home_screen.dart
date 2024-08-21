/* Created By Bilawal Mehmood  on 25-JAN-2024*/
import 'package:excise_e_auction/ui/custom_widgets/general_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/controllers/home_screen_controller.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_scaffold.dart';
import 'package:excise_e_auction/utils/app_colors.dart';

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
          Container(
            width: Get.width*0.4,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
             gradient: LinearGradient(
               colors: [kPrimaryColor,kPrimaryColor.withOpacity(0.8)],
               begin: Alignment.topCenter,
               end: Alignment.bottomCenter
             ),
              borderRadius: BorderRadius.circular(10) 
            ),
            child: Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Auction ID",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white.withOpacity(0.5)),),
                const Text("0011234",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: Colors.white),),
              ],
            )),
          ),
          SizedBox(height: Get.height*0.05),
          GridView.builder(
            shrinkWrap: true,
            itemCount: controller.homeCards.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.2, crossAxisSpacing: 10,mainAxisSpacing: 20),
            itemBuilder: (context,index){
              return homeCard(title: controller.homeCards[index]["title"],subTitle: controller.homeCards[index]["subTitle"],iconPath: controller.homeCards[index]["iconPath"],onTap: (){});
            }
          ),
          SizedBox(height: Get.height*0.05),
          GeneralButton(onPressed: (){},text: "Place a Bid",color: kBlackColor,)
        ],
      ),
    );
  }

   Widget homeCard({String title="Title", String subTitle="Title", String iconPath='assets/icons/l_plate.png', required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.all(8),
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5) ,
          boxShadow:  const [
            BoxShadow(color: Colors.black12,blurRadius: 7,offset: Offset(2, 2)),
            BoxShadow(color: Colors.black12,blurRadius: 7,offset: Offset(-2, -2))
            ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(iconPath,height: 30,width: 30, fit: BoxFit.contain),
            Text(title,textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,
              style:  const TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: kPrimaryColor)),
            Text(subTitle,textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,
              style:  const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: kBlackColor))
          ],
        ),
      ),
    );
  }
}
