import 'package:excise_e_auction/models/auction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/utils/constants.dart';

import '../models/premium_number_model.dart';

class PremiumNumberListScreenController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxList<PremiumNumberModel> auctionsList = RxList([]);



  @override
  void onInit() {
    super.onInit();
    auctionsList.value = auctionCards;
  }

  void onTapItem(PremiumNumberModel number){
    Get.toNamed(kTagWinningNbrScreenRoute, arguments: number);
  }





  List<PremiumNumberModel> auctionCards = [
    PremiumNumberModel(
      id: "1",
      numberPlat: 'ALI-01',
      bidType: 'silver',
      date: '20/08/2024',
      purchasePrice: "100000",
    ),
    PremiumNumberModel(
      id: "2",
      numberPlat: 'ALI-02',
      bidType: 'gold',
      date: '21/08/2024',
      purchasePrice: "300000",
    ),
    PremiumNumberModel(
      id: "3",
      numberPlat: 'ALI-03',
      bidType: 'platinum',
      date: '22/08/2024',
      purchasePrice: "250000",
    ),
  ];

}