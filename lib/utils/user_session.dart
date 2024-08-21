import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/models/user_model.dart';
import '../models/token_model.dart';

/*Created By: Amjad Jamali on 15-Aug-2023*/

class UserSession {

  static final RxBool isDataChanged = RxBool(false);
  static final Rx<UserModel> userModel = UserModel.empty().obs;
  static Rx<Offset> backButtonPosition = Offset(12, Get.height*0.8).obs;
  static RxInt backButtonTransparency = (0xCC).obs;
  static const String keyAllDataSynced = "AllDataSynced";

  static final UserSession _instance = UserSession._internal();
  UserSession._internal();
  factory UserSession() {
    return _instance;
  }

  Future<bool> createSession({required UserModel user}) async {
    const FlutterSecureStorage storage =  FlutterSecureStorage();
    userModel.value = user;
    await storage.write(key: 'USER_DATA', value: jsonEncode(userModel.value.toOfflineJson()));
    return true;
  }

  Future<bool> isUserLoggedIn() async {
    const FlutterSecureStorage storage =  FlutterSecureStorage();
    final value = await storage.read(key: 'USER_DATA');
    userModel.value = UserModel.fromOfflineJson(jsonDecode(value ?? "{}"));
    return !userModel.value.isEmpty && userModel.value.isRemembered;
  }

  Future<bool> logout() async {
    const FlutterSecureStorage storage =  FlutterSecureStorage();
    await storage.delete(key: 'USER_DATA');
    userModel.value = UserModel.empty();
    return true;
  }

  Future<void> saveToken({required TokenModel token}) async {
    const FlutterSecureStorage storage =  FlutterSecureStorage();
    await storage.write(key: 'access_token', value: jsonEncode(token.forSession()));
  }

  Future<TokenModel> getToken() async {
    const FlutterSecureStorage storage =  FlutterSecureStorage();
    final value = await storage.read(key: 'access_token');
    final TokenModel token = TokenModel.fromSession(jsonDecode(value ?? '{}'));
    return token;
  }


}
