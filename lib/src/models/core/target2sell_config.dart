class Target2SellConfiguration {
  Target2SellConfiguration({
    required this.customerId,
    this.enableCMP = false,
    this.enableDebugLogs = true,
  });

  final String customerId;
  final bool enableCMP;
  final bool enableDebugLogs;
}
