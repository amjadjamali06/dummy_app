import 'package:excise_e_auction/models/auction_model.dart';
import 'package:excise_e_auction/models/item_model.dart';
import 'package:excise_e_auction/models/my_bid_model.dart';
import 'package:excise_e_auction/models/placeBidModel.dart';
import 'package:excise_e_auction/models/user_model.dart';
import 'package:excise_e_auction/utils/user_session.dart';

import '../models/bid_request_model.dart';

class DummyData {
  static bool debugMode = true;

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
    AuctionModel(
      id: "4",
      numberPlat: 'ALI-01',
      bidType: 'silver',
      startDate: '20 Aug, 2024 08:00',
      endDate: '22 Aug, 2024 08:00',
      bidStartAmount: "100000",
      bidEndAmount: "150000",
    ),
    AuctionModel(
      id: "5",
      numberPlat: 'ALI-02',
      bidType: 'gold',
      startDate: '20 Aug, 2024 08:00',
      endDate: '22 Aug, 2024 08:00',
      bidStartAmount: "300000",
      bidEndAmount: "350000",
    ),
    AuctionModel(
      id: "6",
      numberPlat: 'ALI-03',
      bidType: 'platinum',
      startDate: '20 Aug, 2024 08:00',
      endDate: '22 Aug, 2024 08:00',
      bidStartAmount: "200000",
      bidEndAmount: "250000",
    ),
  ];
  List<BidRequestModel> myBidRequests = [
    BidRequestModel(
      id: "1",
      bidderId: 'ALI-01',
      bidderName: 'Suhail',
      bidType: 'silver',
      status: "pending",
      date: '20/08/2024',
    ),
    BidRequestModel(
      id: "1",
      bidderId: 'ALI-01',
      bidderName: 'Sahil',
      bidType: 'platinum',
      status: "rejected",
      date: '20/08/2024',
    ),
    BidRequestModel(
      id: "1",
      bidderId: 'ALI-01',
      bidderName: 'Suhail',
      bidType: 'gold',
      status: "approved",
      date: '20/08/2024',
    ),
  ];

  List<MyBidModel> myPlacedBids = [
    MyBidModel(
      id: "1",
      bidderId: 'ALI-01',
      bidderName: 'Suhail',
      bidType: 'silver',
      amount: "200000",
      date: '20/08/2024',
    ),
    MyBidModel(
      id: "1",
      bidderId: 'ALI-01',
      bidderName: 'Sahil',
      bidType: 'platinum',
      amount: "200000",
      date: '20/08/2024',
    ),
    MyBidModel(
      id: "1",
      bidderId: 'ALI-01',
      bidderName: 'Suhail',
      bidType: 'gold',
      amount: "200000",
      date: '20/08/2024',
    ),
  ];



  List<AuctionModel> getAuctionCategoryWiseList(String category) {
    if(category.isEmpty) return [];
    return auctionCards.where((test)=>test.bidType == category).toList();
  }

  static List<UserModel> users = [UserModel.fromJson({"id":'1', "name":'Amjad Jamali', "email":'amjad@gmail.com', "password":'123456'})];

  static List<String> genderList() => ["Male", "Female", "Transgender"];

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


 static List<ItemModel> getDropDownDummyLocation(){
  return [
    for(int i=0; i<10;i++)
      ItemModel("$i", "Item-${i+1}"),

  ];
 }

 static List<ItemModel> getGenderData(){
  return [
    ItemModel("male", "Male"),
    ItemModel("female", "Female"),
    ItemModel("transgender", "Transgender"),

  ];
 }

 static List<ItemModel> getDropDownDummyProgram(){
  return [
    ItemModel("0", "Nayee Zindagi"),
    ItemModel("1", "Humqadam"),
    ItemModel("2", "Bahimmat Buzurg"),
    ItemModel("3", "Zewar Taleem"),
    ItemModel("4", "Sila Fun"),
    ItemModel("5", "Masawaat"),
    ItemModel("6", "Income Generation"),
    ItemModel("7", "Bunyad"),
    ItemModel("8", "Aagosh"),
    ItemModel("9", "Khudmukhtar"),
  ];
 }

  static List<Map<String, dynamic>> getIntakeRegisterCardsData() {
    return [
      {
        "id": "0",
        "name": "Amjad Ali",
        "cnic": "12345-1234567-3",
        "phone": "03331234567",
        "city": "Karachi",
        "dob": "01-01-1990",
        "gender": "male",
        "program": "Nayee Zindagi",
      }
    ];
  }

  static List<Map<String, dynamic>> getComplaintCardData(){
  return [
    {
      "id": "Comp#12345685",
      "title": "Payment Issue",
      "phone":"03412222222",
      "cnic":"44205-2123322-8",
      "status": "Pending",
      "programName": "Masawaat",
    }
  ];
  }

  static List<Map<String, dynamic>> getTaskCardData(){
  return [
    {
      "id": "Task#12345678",
      "title": "What is Your Name?",
      "subTitle": "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
      "progress": 1.0,
      "status": "Overdue",
      "date": "Due Date Expired",
    }
  ];
}

  static List<Map<String, dynamic>> getProgramsData() {
    return [
      {
        "id": "0",
        "title": "Nayee Zindagi",
        "borderColorCode": 0xffF7941D,
        "iconPath":'assets/icons/nai_zindagi.png',
        "slug": "program1",
      },

    ];
  }
}
