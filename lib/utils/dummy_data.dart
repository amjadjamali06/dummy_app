import 'package:excise_e_auction/models/item_model.dart';
import 'package:excise_e_auction/models/placeBidModel.dart';
import 'package:excise_e_auction/models/user_model.dart';

class DummyData {
  static bool debugMode = true;

  static List<String> genderList() => ["Male", "Female", "Transgender"];

  static UserModel loginUser() {
    return UserModel.fromJson({
      "id":'1',
      "name":'Amjad',
      "email":'amjadjamali@gmail.com',
      "group_id":'1',
      "district_id":'235sdgb-egy45yhy-34y4g34y',
    });
 }

 static List<ItemModel> getDropDownDummyLocation(){
  return [
    ItemModel("0", "item1"),
    ItemModel("1", "item2"),
    ItemModel("2", "item3"),
    ItemModel("3", "item4"),
    ItemModel("4", "item5"),
    ItemModel("5", "item6"),
    ItemModel("6", "item7"),
    ItemModel("7", "item8"),
    ItemModel("8", "item9"),
    ItemModel("9", "item10"),
    
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

  static PlaceBidModel getPlaceBidData(){
    return PlaceBidModel(id: "1", plateCategory: 'Platinum', nbrPlate: 'Ahmed 07', bidStartDate: '22/3/2024 | 11:59', bidEndDate: '26/3/2024 | 11:59', startingBidAmount: '100,000', currentHighestBid: '120,000', bidAmount: '');
  }
}
