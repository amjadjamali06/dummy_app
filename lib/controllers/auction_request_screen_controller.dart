import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/text_field_manager.dart';

class AuctionRequestScreenController extends GetxController{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextFieldManager desiredNbrPlateTfManager = TextFieldManager('Desired Characters or Numbers for the Plate',hint: 'Ahmed-07');

  void removeFocus(){
    if(desiredNbrPlateTfManager.focusNode.hasFocus){
      desiredNbrPlateTfManager.focusNode.unfocus();
    }
  }
}