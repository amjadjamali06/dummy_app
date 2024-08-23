import 'package:excise_e_auction/models/auction_bid_model.dart';
import 'package:excise_e_auction/models/version_check_model.dart';


import '../../models/response_model.dart';
import '../../utils/dummy_data.dart';
import 'http_client.dart';
import '../service_urls.dart';

class GeneralService {
  late HTTPClient _httpClient;

  GeneralService._internal() {
    _httpClient = HTTPClient();
  }

  factory GeneralService() {
    return _instance;
  }
  static final GeneralService _instance = GeneralService._internal();

  Future<VersionCheckModel> getVersionData() async {
    ResponseModel responseModel = await _httpClient.getRequest(url: kVersionCheckURL,requireToken: false);
    if (responseModel.statusCode == 200 && responseModel.data!=null && responseModel.data.isNotEmpty) {
      VersionCheckModel versionCheckModel = VersionCheckModel.fromJson(responseModel.data is List  ? responseModel.data.first : responseModel.data);
      return versionCheckModel;
    } else {
      return VersionCheckModel.empty();
    }
  }

  Future<String> addAuctionBidToHistory({required AuctionBidModel auctionBidModel})async{
    String response = "";
    Map<String, String> body = {};
    try {
      ResponseModel responseModel = await _httpClient.postRequest(url: kLoginURL, requestBody: body, requireToken: false);
      if(responseModel.statusCode == 200 && responseModel.data != null && responseModel.data['token'] != null ){
        response = responseModel.statusDescription;
      }else if(DummyData.debugMode){
        response = await DummyData.addAuctionBidHistoryData(auctionBidModel);
      }else{
        response = responseModel.statusDescription;
      }
    } on Exception catch (_) {}
    return response;
  }

}
