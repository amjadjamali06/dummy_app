import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:excise_e_auction/models/premium_number_model.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_dialogs.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_progress_dialog.dart';
import 'package:excise_e_auction/utils/constants.dart';
import 'package:excise_e_auction/utils/text_field_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TagWinningNbrScreenController extends GetxController{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextFieldManager winningAuctionIdTfManager = TextFieldManager('',hint:'Winning Auction Id',mandatory: false);
  TextFieldManager vehicleRegistrationNbrTfManager = TextFieldManager('',hint:'Vehicle Registration Number');
  TextFieldManager winningNbrPlateDetailsTfManager = TextFieldManager('',hint:'Winning Number Plate Details',mandatory: false);

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

  Future<void> onTapSubmit() async {
    if(validateData()){
      removeFocus();
      ProgressDialog().showDialog();
      await Future.delayed(const Duration(seconds: 2));
      ProgressDialog().dismissDialog();
      CustomDialogs().showDialog("Success", "Request Submitted Successfully", DialogType.success,onOkBtnPressed: (){
        Get.offAllNamed(kDashboardScreenRoute);
      });
    }
  }

  bool validateData(){
    return vehicleRegistrationNbrTfManager.validate();
  }

}