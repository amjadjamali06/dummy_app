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
      body: buildBody.marginZero,
      horizontalPadding: 24,
    );
  }

  Widget get buildBody{
    return Obx(
      ()=> Column(

        children: [
          ListView.separated(
            padding: EdgeInsets.only(top: Get.height * 0.16, bottom: Get.height * 0.1),
            shrinkWrap: true,
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              return auctionCategoryCardNew(
                cardName: controller.categories[index].capitalize.toString(),
                text: "AAA",
                iconPath:controller.categories[index] == "platinum"? 'assets/images/platinum.png':controller.categories[index] =="silver"?'assets/images/silver.png':'assets/images/gold.png',
                onTap: (){
                  controller.onCategorySelected(index);
                },
                isSelected: controller.selectedValue.value == index,
              );
            }, separatorBuilder: (_, int index)=>const SizedBox(height: 24),
          ),
          GeneralButton(onPressed: ()=>controller.navigateToCategories(),color: kBlackColor, text: "Continue",)
        ],
      ),
    );
  }


  Widget auctionCategoryCardNew({String cardName="",String text="", String iconPath='',
    required Function() onTap,
    required bool isSelected,
  }){
    return Container(
      width: Get.width,
      height: 70,
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(0, 1),
            spreadRadius: 1,
            blurRadius: 1,
          )
        ],
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         const SizedBox(width: 10,),
          GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? kLightGreyColor : kLightGreyColor, // Active or Inactive color
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
                    color: isSelected ? kPrimaryColor : Colors.transparent,
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
                  Text(cardName,style: GoogleFonts.oxygen(fontSize: 18,color: kWhiteColor,fontWeight: FontWeight.w600, shadows: [Shadow(
                  offset: const Offset(2.0, 5.0),blurRadius: 8.0,color: kBlackColor.withOpacity(0.5),),])),
                  Text(text, style: const TextStyle(color: kLightGreyColor,fontSize: 14, fontWeight: FontWeight.w500),textAlign: TextAlign.center,)
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
    );
  }


/*Widget auctionCategoryCardOld({String cardName="",String text="", String iconPath='', required Function() onTap}){
   return GestureDetector(
     onTap: ()=>controller.onTapItem(cardName),
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
             color: cardName== "GOLD"? kCategoryOrangeBoxColor: kCategoryDarkGreyBoxColor,
           ), child: Text(text, style: const TextStyle(color: kWhiteColor,fontSize: 15, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),),),
           Expanded(child: Container(padding: const EdgeInsets.only(right: 5, ),child: const Icon(Icons.arrow_forward, color: kWhiteColor, size: 33,)))

         ],
       ),
     ),
   );
  }*/
}
