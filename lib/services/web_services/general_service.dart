import 'package:excise_e_auction/models/version_check_model.dart';


import '../../models/response_model.dart';
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

}
