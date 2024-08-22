import 'package:excise_e_auction/controllers/auction_request_category_screen_controller.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_scaffold.dart';
import 'package:excise_e_auction/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../custom_widgets/general_button.dart';

class AuctionRequestCategoryScreen extends GetView<AuctionRequestCategoryScreenController> {
  const AuctionRequestCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        className: runtimeType.toString(),
        screenName: "Auction Request",
        scaffoldKey: controller.scaffoldKey,
        body: buildBody);
  }
  Widget get buildBody{
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Obx(
          ()=> Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             const SizedBox(height: 20),
              auctionRequestCategoryCardNew(cardName: "PLATINUM",text: "AAA",iconPath: 'assets/images/platinum.png',  onTap: (){}, groupValue: controller.selectedValue.value,value: 1, onChanged: (val) {controller.updateSelectedValue;},),
              const SizedBox(height: 20),
              auctionRequestCategoryCardNew(cardName: "GOLD",text: "AAAAA", iconPath: 'assets/images/gold.png', onTap: (){}, groupValue: controller.selectedValue.value,value: 2, onChanged: (val) {controller.updateSelectedValue;},),
              const SizedBox(height: 20),
              auctionRequestCategoryCardNew(cardName: "SILVER",text: "AAAAAAA", iconPath: 'assets/images/silver.png', onTap: (){}, groupValue: controller.selectedValue.value,value: 3, onChanged: (val) {controller.updateSelectedValue;},),
              const SizedBox(height: 30),
              SizedBox(width: 353, child: GeneralButton(onPressed: (){},color: kBlackColor, text: "Continue",))
            ],
          ),
        ),
      ),
    );
  }

  Widget auctionRequestCategoryCardNew({String cardName="",String text="", String iconPath='',
    required Function() onTap,
    required int groupValue,
    required int value,
    required Function(int?) onChanged,
  }){
    return GestureDetector(
      onTap: () {
        controller.selectedValue(value);
      },
      child:
      Container(
        width: 350,
        height: 70,
        decoration: BoxDecoration(color: kCardColor,borderRadius: BorderRadius.circular(15), boxShadow:
        const [
          BoxShadow(
              blurRadius: 0.5, color: kLightGreyColor,
              offset: Offset(1, 1)
          )
        ]
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 10,),
            GestureDetector(
              onTap: () {
                controller.selectedValue(value);
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: groupValue == value ? kLightGreyColor : kLightGreyColor, // Active or Inactive color
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: 16.0,
                    height: 16.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: groupValue == value ? kPrimaryColor : Colors.transparent, // Inner circle color
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Container(padding: const EdgeInsets.only(left: 20,top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cardName,style: GoogleFonts.oxygen(fontSize: 19,color: kWhiteColor,fontWeight: FontWeight.w800, shadows: [Shadow(
                      offset: const Offset(2.0, 5.0),blurRadius: 8.0,color: kBlackColor.withOpacity(0.5),),])),
                    Text(text, style: const TextStyle(color: kLightGreyColor,fontSize: 15, fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                  ],
                ),),
            ),
            Expanded(flex: 1,
              child: Container(width:double.infinity,height: 40, padding: const EdgeInsets.only(left: 25,right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),), child:
                Image.asset(iconPath, fit: BoxFit.fill,),),),
          ],
        ),
      ),
    );
  }

  /* Widget auctionRequestCategoryCardOld({String cardName="",String text="", String iconPath='', required Function() onTap}){
    return GestureDetector(
      onTap: () {},
      child:
      Container(
        width: 350,
        height: 70,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage(iconPath)),borderRadius: BorderRadius.circular(2)),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Container(padding: const EdgeInsets.only(left: 30),child: Text(cardName,style: GoogleFonts.oxygen(fontSize: 19,color: kWhiteColor,fontWeight: FontWeight.w800, shadows: [Shadow(
                offset: const Offset(2.0, 5.0),blurRadius: 8.0,color: kBlackColor.withOpacity(0.5),),])),),
            ),
            Expanded(flex: 1,child: Container(width: double.infinity,height: 33,padding: const EdgeInsets.only(top: 5), decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: cardName== "GOLD"?kCategoryOrangeBoxColor: kCategoryDarkGreyBoxColor,
            ), child: Text(text, style: const TextStyle(color: kWhiteColor,fontSize: 15, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),),),
            Expanded(child: Container(padding: const EdgeInsets.only(right: 5, ),child: const Icon(Icons.arrow_forward, color: kWhiteColor, size: 33,)))
          ],
        ),
      ),
    );
   }*/

}
