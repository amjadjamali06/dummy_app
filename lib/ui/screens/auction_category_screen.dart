import 'package:excise_e_auction/controllers/auction_category_screen_controller.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_scaffold.dart';
import 'package:excise_e_auction/ui/custom_widgets/general_button.dart';
import 'package:excise_e_auction/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AuctionCategoryScreen extends GetView<AuctionCategoryScreenController> {
  const AuctionCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      className: runtimeType.toString(),
      screenName: "Auction Category",
      scaffoldKey: controller.scaffoldKey,
      horizontalPadding: 24,
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: Get.height*0.07),
            child: Text("Select One",style: GoogleFonts.roboto(fontSize: 20,color: kBlackColor,fontWeight: FontWeight.w500),),
          ),
          ListView.separated(
            padding: EdgeInsets.only(top: Get.height * 0.05, bottom: Get.height * 0.1, left: 2, right: 2),
            shrinkWrap: true,
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              return Obx(()=> auctionCategoryCardNew(
                cardName: controller.categories[index].capitalize.toString(),
                text: controller.categories[index] == "platinum"? 'Choose Any 3 Character (AAA)':controller.categories[index] =="silver"?'Choose Any 7 Character (AAAAAAA)':'Choose Any 5 Character (AAAAA)',
                iconPath:controller.categories[index] == "platinum"? 'assets/images/platinum.png':controller.categories[index] =="silver"?'assets/images/silver.png':'assets/images/gold.png',
                onTap: (){
                  controller.onCategorySelected(index);
                },
                isSelected: controller.selectedValue.value == index,
              ));
            }, separatorBuilder: (_, int index)=>const SizedBox(height: 24),
          ),
          GeneralButton(onPressed: ()=>controller.navigateToCategories(), text: "Continue",)
        ],
      ),
    );
  }


  Widget auctionCategoryCardNew({String cardName="",String text="", String iconPath='',
    required Function() onTap,
    required bool isSelected,
  }){
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: Get.width,

        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           const SizedBox(width: 10,),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? kPrimaryColor : kPrimaryColor, // Active or Inactive color
                  width: 2.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? kPrimaryColor : Colors.transparent,
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Container(padding: const EdgeInsets.only(left: 10,top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cardName,style: GoogleFonts.roboto(fontSize: 19,color: kBlackColor,fontWeight: FontWeight.w800,)),
                    Text(text, style: GoogleFonts.roboto(color: kGreyColor,fontSize: 13,fontWeight: FontWeight.normal),textAlign: TextAlign.left,)
                  ],
                ),),
            ),
            Expanded(flex: 1,
              child: Container(width:double.infinity,height: 30, padding: const EdgeInsets.only(left: 25,right: 15),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),), child:
                Image.asset(iconPath, fit: BoxFit.fill,),),),
          ],
        ),
      ),
    );
  }

}
