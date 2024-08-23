class AuctionRequestModel {
  final String id;
  final String bidType;
  final String numberPlate;
  final String status;
  final String date;

  AuctionRequestModel({
    required this.id,
    required this.numberPlate,
    required this.bidType,
    required this.status,
    required this.date,
  });

  factory AuctionRequestModel.fromJson(Map<String, dynamic> json) {
    return AuctionRequestModel(
      id: json['id']??"",
      bidType: json['bidType']??"",
      numberPlate: json['numberPlate']??"",
      status: "${json['status']??0}",
      date: json['date']??"",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bidType': bidType,
      'numberPlate': numberPlate,
      'status': status,
      'date': date,
    };
  }
}
