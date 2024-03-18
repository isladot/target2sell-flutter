class Target2SellRankRequest {
  Target2SellRankRequest({
    required this.customerId,
    required this.userId,
    this.pageId,
  });

  final String customerId;
  final String userId;
  final String? pageId;

  Map<String, String> toJson() => pageId != null
      ? <String, String>{
          't2s-customer-id': customerId,
          'userCookie': userId,
          'setID': pageId!,
        }
      : {
          't2s-customer-id': customerId,
          'userCookie': userId,
        };

  @override
  String toString() => toJson().toString();
}
