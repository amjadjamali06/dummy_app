import 'package:excise_e_auction/models/auction_model.dart';
import 'package:excise_e_auction/models/user_model.dart';
import 'package:excise_e_auction/utils/user_session.dart';
import 'package:get/get.dart';

import '../models/auction_request_model.dart';

import '../models/auction_bid_model.dart';

class DummyData {

  static bool debugMode = true;

  static List<UserModel> users = [];

  List<AuctionModel> auctionList = [
    AuctionModel(
      id: "1",
      numberPlat: 'BILAWAL',
      bidType: 'silver',
      startDate: '20 Aug, 2024 08:00',
      endDate: '22 Aug, 2024 08:00',
      bidStartAmount: "100000",
      bidEndAmount: "150000",
    ),
    AuctionModel(
      id: "2",
      numberPlat: 'AMJAD',
      bidType: 'gold',
      startDate: '20 Aug, 2024 08:00',
      endDate: '22 Aug, 2024 08:00',
      bidStartAmount: "300000",
      bidEndAmount: "350000",
    ),
    AuctionModel(
      id: "3",
      numberPlat: 'ALI',
      bidType: 'platinum',
      startDate: '20 Aug, 2024 08:00',
      endDate: '22 Aug, 2024 08:00',
      bidStartAmount: "200000",
      bidEndAmount: "250000",
    ),
    AuctionModel(
      id: "4",
      numberPlat: 'MEHMOOD',
      bidType: 'silver',
      startDate: '20 Aug, 2024 08:00',
      endDate: '22 Aug, 2024 08:00',
      bidStartAmount: "100000",
      bidEndAmount: "150000",
    ),
    AuctionModel(
      id: "5",
      numberPlat: 'TARIQ',
      bidType: 'gold',
      startDate: '20 Aug, 2024 08:00',
      endDate: '22 Aug, 2024 08:00',
      bidStartAmount: "300000",
      bidEndAmount: "350000",
    ),
    AuctionModel(
      id: "6",
      numberPlat: '786',
      bidType: 'platinum',
      startDate: '20 Aug, 2024 08:00',
      endDate: '22 Aug, 2024 08:00',
      bidStartAmount: "200000",
      bidEndAmount: "250000",
    ),
  ];

  static RxList<AuctionRequestModel> auctionRequestList = [
    AuctionRequestModel(
      id: "1",
      numberPlate: 'AHMED-01',
      bidType: 'silver',
      status: "pending",
      date: '20/08/2024',
    ),
    AuctionRequestModel(
      id: "1",
      numberPlate: 'DUA',
      bidType: 'platinum',
      status: "rejected",
      date: '20/08/2024',
    ),
    AuctionRequestModel(
      id: "1",
      numberPlate: 'SAHIL',
      bidType: 'gold',
      status: "approved",
      date: '20/08/2024',
    ),
  ].obs;

  static List<AuctionBidModel> bidsList = [
    AuctionBidModel.fromJson({
      "id": '1',
      "plateCategory": 'silver',
      "nbrPlate": 'SHAHBAZ',
      "bidDate": '22-08-2024',
      "bidAmount": '50000',
      "auctionId": '1001',
    }),
    AuctionBidModel.fromJson({
      "id": '2',
      "plateCategory": 'gold',
      "nbrPlate": 'ARHAM',
      "bidDate": '22-08-2024',
      "bidAmount": '75000',
      "auctionId": '1002',
    }),
    AuctionBidModel.fromJson({
      "id": '3',
      "plateCategory": 'platinum',
      "nbrPlate": '110',
      "bidDate": '22-08-2024',
      "bidAmount": '60000',
      "auctionId": '1003',
    }),
  ];

  static Future<UserModel> loginUser(String username, String password) async{
    DummyData.users = await UserSession().fetchUsersList();
    for (UserModel user in users) {
      if(username==user.email && password == user.password){
        return user;
      }
    }
    return UserModel.empty()..responseMessage = "Invalid Username or Password !";
  }

  static Future<String> registerUser(UserModel user) async{
    DummyData.users = await UserSession().fetchUsersList();
    for (var u in users) {
      if(u.email == user.email){
        return 'Email Address already Registered';
      }
    }
    users.add(user);
    UserSession().updateUsersList(usersList: DummyData.users);
    return "Success";
  }

  List<AuctionModel> getAuctionsByCategory(String category) {
    if(category.isEmpty) return [];
    return auctionList.where((test)=>test.bidType == category).toList();
  }

  static Future<String> addAuctionBidHistoryData(AuctionBidModel bidModel) async{
    bidsList.insert(0,bidModel);
    return "Success";
  }
}
