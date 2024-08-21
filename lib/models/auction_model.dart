class AuctionModel {
  final String id;
  final String numberPlat;
  final String bidType;
  final String startDate;
  final String endDate;
  final String bidStartAmount;
  final String bidEndAmount;

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
