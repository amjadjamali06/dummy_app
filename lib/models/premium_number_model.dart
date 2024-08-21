class PremiumNumberModel {
  final String id;
  final String numberPlat;
  final String bidType;
  final String purchasePrice;
  final String date;

  PremiumNumberModel({
    required this.id,
    required this.numberPlat,
    required this.bidType,
    required this.purchasePrice,
    required this.date,
  });

  factory PremiumNumberModel.fromJson(Map<String, dynamic> json) {
    return PremiumNumberModel(
      id: json['id']??"",
      numberPlat: json['numberPlat']??"",
      bidType: json['bidType']??"",
      purchasePrice: "${json['purchasePrice']??0}",
      date: json['date']??"",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'numberPlat': numberPlat,
      'bidType': bidType,
      'purchasePrice': purchasePrice,
      'date': date,
    };
  }
}
