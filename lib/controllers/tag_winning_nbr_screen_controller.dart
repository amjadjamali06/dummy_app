import 'package:excise_e_auction/models/premium_number_model.dart';
import 'package:excise_e_auction/utils/text_field_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TagWinningNbrScreenController extends GetxController{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextFieldManager winningAuctionIdTfManager = TextFieldManager('Winning Auction Id',mandatory: false);
  TextFieldManager vehicleRegistrationNbrTfManager = TextFieldManager('Vehicle Registration Number');
  TextFieldManager winningNbrPlateDetailsTfManager = TextFieldManager('Winning Number Plate Details',mandatory: false);

  PremiumNumberModel number = PremiumNumberModel.fromJson({});

  @override
  void onReady() {
    if(Get.arguments !=null && Get.arguments is PremiumNumberModel) {
      number = Get.arguments;
      winningAuctionIdTfManager.controller.text = number.id;
      winningNbrPlateDetailsTfManager.controller.text = number.numberPlat;
    }
    
    
    super.onReady();
  }

  void removeFocus(){
    if(vehicleRegistrationNbrTfManager.focusNode.hasFocus){
      vehicleRegistrationNbrTfManager.focusNode.unfocus();
    }
  }
}