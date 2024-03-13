class RankRequest {
  RankRequest({
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
}
