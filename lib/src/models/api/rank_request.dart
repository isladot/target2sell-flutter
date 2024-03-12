class RankRequest {
  final String customerId;
  final String userId;
  final String? pageId;

  RankRequest({
    required this.customerId,
    required this.userId,
    this.pageId,
  });

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
}
