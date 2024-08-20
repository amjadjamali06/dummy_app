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
  bool isRembembered = false;
  String role = "";

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
  }

  UserModel.fromOfflineJson(Map<String, dynamic> json) {
    id = '${json['id'] ?? ''}';
    name = '${json["name"] ?? "Admin"}';
    fatherName = '${json["father_name"] ?? ""}';
    cnic = '${json["cnic"] ?? ""}';
    age = '${json["age"] ?? ""}';
    email = '${json["email"] ?? ""}';
    status = '${json["status"] ?? ""}';
    phoneNumber = '${json["phone_number"] ?? ""}';
    file = '${json["file"] ?? ""}';
    isRembembered = json['is_remembered'] ?? false;
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
      "is_remembered": isRembembered,
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
