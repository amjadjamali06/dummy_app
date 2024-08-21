import 'package:excise_e_auction/models/auction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/utils/constants.dart';

class AuctionsListScreenController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxList<AuctionModel> auctionsList = RxList([]);



  @override
  void onInit() {
    super.onInit();
    auctionsList.value = auctionCards;
  }


  List<AuctionModel> auctionCards = [
    AuctionModel(
      id: "1",
      numberPlat: 'ALI-01',
      bidType: 'silver',
      startDate: '20 Aug, 2024 08:00',
      endDate: '22 Aug, 2024 08:00',
      bidStartAmount: "100000",
      bidEndAmount: "150000",
    ),
    AuctionModel(
      id: "2",
      numberPlat: 'ALI-02',
      bidType: 'gold',
      startDate: '20 Aug, 2024 08:00',
      endDate: '22 Aug, 2024 08:00',
      bidStartAmount: "300000",
      bidEndAmount: "350000",
    ),
    AuctionModel(
      id: "3",
      numberPlat: 'ALI-03',
      bidType: 'platinum',
      startDate: '20 Aug, 2024 08:00',
      endDate: '22 Aug, 2024 08:00',
      bidStartAmount: "200000",
      bidEndAmount: "250000",
    ),
  ];

}