class Target2SellConfiguration {
  final String customerId;
  final bool enableCMP;
  final bool enableDebugLogs;

  Target2SellConfiguration({
    required this.customerId,
    this.enableCMP = false,
    this.enableDebugLogs = true,
  });
}
