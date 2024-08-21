class PlaceBidModel{
  String id='';
  String plateCategory='';
  String nbrPlate='';
  String bidStartDate='';
  String bidEndDate='';
  String startingBidAmount='';
  String currentHighestBid='';
  String bidAmount='';


  PlaceBidModel({
      required this.id,
      required this.plateCategory,
      required this.nbrPlate,
      required this.bidStartDate,
      required this.bidEndDate,
      required this.startingBidAmount,
      required this.currentHighestBid,
      required this.bidAmount});

  Map<String,dynamic> tojson(){
    return {
      'id': id,
      'plateCategory': plateCategory,
      'nbrPlate': nbrPlate,
      'bidStartDate': bidStartDate,
      'bidEndDate': bidEndDate,
      'startingBidAmount': startingBidAmount,
      'currentHighestBid': currentHighestBid,
      'bidAmount': bidAmount
    };
  }

  PlaceBidModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        plateCategory = json['plateCategory'] ?? '',
        nbrPlate = json['nbrPlate'] ?? '',
        bidStartDate = json['bidStartDate'] ?? '',
        bidEndDate = json['bidEndDate'] ?? '',
        startingBidAmount = json['startingBidAmount'] ?? '',
        currentHighestBid = json['currentHighestBid'] ?? '',
        bidAmount = json['bidAmount'] ?? '';
}