
import 'dart:developer';

import 'package:excise_e_auction/models/response_model.dart';
import 'package:excise_e_auction/models/token_model.dart';
import 'package:excise_e_auction/models/user_model.dart';
import 'package:excise_e_auction/services/service_urls.dart';
import 'package:excise_e_auction/services/web_services/http_client.dart';
import 'package:excise_e_auction/utils/dummy_data.dart';
import 'package:excise_e_auction/utils/user_session.dart';

class UserService{

  static final UserService _instance = UserService._internal();
  UserService._internal(){
    _httpClient = HTTPClient();
  }
  factory UserService()=>_instance;

  late HTTPClient _httpClient;



  Future<UserModel> loginUser({required String username, required String password})async{
    UserModel user = UserModel.empty();
    Map<String, String> body = {
      'email': username,
      'password':password
    };
    try {
      ResponseModel responseModel = await _httpClient.postRequest(url: kLoginURL, requestBody: body, requireToken: false);
      if(responseModel.statusCode == 200 && responseModel.data != null && responseModel.data['token'] != null ){
        user = UserModel.fromJson(responseModel.data['user']??{});
       await UserSession().saveToken(token: TokenModel.fromString(responseModel.data['token']??''));
      }else if(DummyData.debugMode){
        user = DummyData.loginUser(username, password);
      }else{
        user.responseMessage = responseModel.statusDescription;
      }
    } on Exception catch (e) {
      log("-===================$e");
    }
    return user;
  }
}