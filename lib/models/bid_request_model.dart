class BidRequestModel {
  final String id;
  final String bidType;
  final String bidderId;
  final String bidderName;
  final String status;
  final String date;

  BidRequestModel({
    required this.id,
    required this.bidderId,
    required this.bidderName,
    required this.bidType,
    required this.status,
    required this.date,
  });

  factory BidRequestModel.fromJson(Map<String, dynamic> json) {
    return BidRequestModel(
      id: json['id']??"",
      bidType: json['bidType']??"",
      bidderName: json['bidderName']??"",
      bidderId: json['bidderId']??"",
      status: "${json['status']??0}",
      date: json['date']??"",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bidType': bidType,
      'bidderId': bidderId,
      'bidderName': bidderName,
      'status': status,
      'date': date,
    };
  }
}
