import 'dart:async';
import 'package:get/get.dart';

class AuctionModel {
   String id='';
   String numberPlat='';
   String bidType='';
   String startDate='';
   String endDate='';
   String bidStartAmount='';
   String bidEndAmount='';
   Duration? expiryDuration;
   Timer? timer;
   RxString expiryTime=''.obs;

  AuctionModel.empty();

  AuctionModel({
    required this.id,
    required this.numberPlat,
    required this.bidType,
    required this.startDate,
    required this.endDate,
    required this.bidStartAmount,
    required this.bidEndAmount,
  });

  factory AuctionModel.fromJson(Map<String, dynamic> json) {
    return AuctionModel(
      id: json['id']??"",
      numberPlat: json['numberPlat']??"",
      bidType: json['bidType']??"",
      startDate: json['startDate']??"",
      endDate: json['endDate']??"",
      bidStartAmount: "${json['bidStartAmount']??0}",
      bidEndAmount: "${json['bidEndAmount']??0}",
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'numberPlat': numberPlat,
      'bidType': bidType,
      'startDate': startDate,
      'endDate': endDate,
      'bidStartAmount': bidStartAmount,
      'bidEndAmount': bidEndAmount,
    };
  }
}
