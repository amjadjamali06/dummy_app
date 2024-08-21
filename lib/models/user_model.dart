import 'package:excise_e_auction/models/base_model.dart';


class UserModel extends BaseModel{
  String id = '';
  String name = "";
  String fatherName = "";
  String cnic = "";
  String age = "";
  String email = "";
  String status = "";
  String phoneNumber = "";
  String file = "";
  bool isRemembered = false;
  String role = "";
  String password = "";

  UserModel.empty();

  UserModel.fromJson(Map<String,dynamic> json){
    id = json['id']??'';
    name = json["name"]??"";
    fatherName = json["father_name"]??"";
    cnic = json["cnic"]??"";
    age = json["age"]??"";
    email = json["email"]??"";
    status = json["status"]??"";    
    phoneNumber = json["phone_number"]??"";
    file = json["file"]??"";
    password = json["password"]??"";
  }

  UserModel.fromOfflineJson(Map<String, dynamic> json) {
    id = '${json['id'] ?? ''}';
    name = '${json["name"] ?? ""}';
    fatherName = '${json["father_name"] ?? ""}';
    cnic = '${json["cnic"] ?? ""}';
    age = '${json["age"] ?? ""}';
    email = '${json["email"] ?? ""}';
    status = '${json["status"] ?? ""}';
    phoneNumber = '${json["phone_number"] ?? ""}';
    file = '${json["file"] ?? ""}';
    isRemembered = json['is_remembered'] ?? false;
    password = json['password'] ?? '';
  }

  Map<String,dynamic> toJson(){
    return {
      "id": id,
      "name": name,
      "email": email,
      "father_ame": fatherName,
      "cnic": cnic,
      "age": age,
      "status": status,
      "phone_number": phoneNumber,
      "file": file,
      "password": password,
    };
  }

  Map<String, dynamic> toOfflineJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "father_ame": fatherName,
      "cnic": cnic,
      "age": age,
      "status": status,
      "phone_number": phoneNumber,
      "file": file,
      "is_remembered": isRemembered,
      "password": password,
    };
  }

  bool get isEmpty {
    return id.isEmpty;
  }


  bool get isPublicUser => role == "public";
  bool get isAdmin => role == "admin";


  @override
  String toString() {
    return '$name ($role)';
  }
}
