import 'package:excise_e_auction/controllers/auction_category_screen_controller.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_scaffold.dart';
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
        screenName: "",
        scaffoldKey: controller.scaffoldKey,
        body: buildBody);
  }

  Widget get buildBody{
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Auction Category",style: GoogleFonts.montserrat(fontSize: 25,fontWeight: FontWeight.w500),),
            const SizedBox(height: 20),
            auctionCategoryCard(cardName: "PLATINUM",text: "AAA",iconPath: 'assets/images/paltinum.png',  onTap: (){}),
            const SizedBox(height: 20),
            auctionCategoryCard(cardName: "GOLD",text: "AAAAA", iconPath: 'assets/images/gold.png', onTap: (){}),
            const SizedBox(height: 20),
            auctionCategoryCard(cardName: "SILVER",text: "AAAAAAA", iconPath: 'assets/images/silver.png', onTap: (){}),
          ],
        ),
      ),
    );
  }

  Widget auctionCategoryCard({String cardName="",String text="", String iconPath='', required Function() onTap}){
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
             color: cardName== "GOLD"? kCategoryOrangeBoxColor: kCategoryDarkGreyBoxColor,
           ), child: Text(text, style: const TextStyle(color: kWhiteColor,fontSize: 15, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),),),
           Expanded(child: Container(padding: const EdgeInsets.only(right: 5, ),child: const Icon(Icons.arrow_forward, color: kWhiteColor, size: 33,)))

         ],
       ),
     ),
   );
  }


}
