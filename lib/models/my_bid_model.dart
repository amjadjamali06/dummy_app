class MyBidModel {
  final String id;
  final String bidType;
  final String bidderId;
  final String bidderName;
  final String amount;
  final String date;

  MyBidModel({
    required this.id,
    required this.bidderId,
    required this.bidderName,
    required this.bidType,
    required this.amount,
    required this.date,
  });

  factory MyBidModel.fromJson(Map<String, dynamic> json) {
    return MyBidModel(
      id: json['id']??"",
      bidType: json['bidType']??"",
      bidderName: json['bidderName']??"",
      bidderId: json['bidderId']??"",
      amount: "${json['amount']??0}",
      date: json['date']??"",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bidType': bidType,
      'bidderId': bidderId,
      'bidderName': bidderName,
      'amount': amount,
      'date': date,
    };
  }
}
