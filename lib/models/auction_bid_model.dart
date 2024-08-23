class AuctionBidModel{
  String id='';
  String name='';
  String plateCategory='';
  String nbrPlate='';
  String bidDate='';
  String bidAmount='';
  String auctionId='';

  AuctionBidModel({
      required this.id,
      required this.plateCategory,
      required this.nbrPlate,
      required this.name,
      required this.bidDate,
      required this.bidAmount,
      required this.auctionId
  });

  Map<String,dynamic> toJson(){
    return {
      'id': id,
      'plateCategory': plateCategory,
      'name': name,
      'nbrPlate': nbrPlate,
      'bidDate': bidDate,
      'auctionId': auctionId,
      'bidAmount': bidAmount
    };
  }

  AuctionBidModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        plateCategory = json['plateCategory'] ?? '',
        nbrPlate = json['nbrPlate'] ?? '',
        bidDate = json['bidDate'] ?? '',
        name = json['name'] ?? '',
        auctionId = json['auctionId'] ?? '',
        bidAmount = json['bidAmount'] ?? '';
}