class TrackingRequest {
  TrackingRequest({
    required this.customerId,
    required this.pageId,
    required this.sessionId,
    this.setId,
    this.userEmail,
    this.userId,
    this.eventType,
    this.spaceId,
    this.productPosition,
    this.basketProduct,
    this.language,
    this.domain,
    this.itemId,
    this.categoryId,
    this.cartTotalAmount,
    this.productQuantity,
    this.keywords,
    this.orderId,
    this.priceList,
    this.userRank,
    this.crmXXX,
    this.mediaRuleId,
    this.algorithm,
    this.mediaCampaignId,
    this.mediaAlgo,
    this.any,
    this.trackingId,
  });

  final String customerId;
  final int pageId;
  final String sessionId;
  final String? setId;
  final String? userEmail;
  final String? userId;
  final String? eventType;
  final String? spaceId;
  final String? productPosition;
  final String? basketProduct;
  final String? language;
  final String? domain;
  final String? itemId;
  final int? categoryId;
  final String? cartTotalAmount;
  final String? productQuantity;
  final String? keywords;
  final String? orderId;
  final String? priceList;
  final String? userRank;
  final String? crmXXX;
  final String? mediaRuleId;
  final String? algorithm;
  final String? mediaCampaignId;
  final String? mediaAlgo;
  final String? any;
  final String? trackingId;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'cID': customerId,
        'pID': pageId,
        'tID': sessionId,
        'setID': setId,
        'uEM': userEmail,
        'uID': userId,
        'eN': eventType,
        'sp': spaceId,
        'po': productPosition,
        'bP': basketProduct,
        'lang': language,
        'domain': domain,
        'iID': itemId,
        'aID': categoryId,
        'bS': cartTotalAmount,
        'qTE': productQuantity,
        'kW': keywords,
        'oID': orderId,
        'priceL': priceList,
        'userRank': userRank,
        'crm_XXX': crmXXX,
        'mediaRuleId': mediaRuleId,
        'ru': algorithm,
        'mediaCampaignId': mediaCampaignId,
        'mediaAlgo': mediaAlgo,
        'any': any,
        'trackingId': trackingId,
      };

  @override
  String toString() => toJson().toString();
}
