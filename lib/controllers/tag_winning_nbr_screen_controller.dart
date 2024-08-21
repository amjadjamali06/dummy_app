import 'package:excise_e_auction/utils/text_field_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TagWinningNbrScreenController extends GetxController{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextFieldManager winningAuctionIdTfManager = TextFieldManager('Winning Aution Id',mandatory: false);
  TextFieldManager vehicleRegistrationNbrTfManager = TextFieldManager('Vehicle Registration Number');
  TextFieldManager winningNbrPlateDetailsTfManager = TextFieldManager('Winning Number Plate Details',mandatory: false);

  void removeFocus(){
    if(vehicleRegistrationNbrTfManager.focusNode.hasFocus){
      vehicleRegistrationNbrTfManager.focusNode.unfocus();
    }
  }
}