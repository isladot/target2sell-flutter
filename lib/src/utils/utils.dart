extension NullableStringExtension on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}

extension StringExtension on String {
  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';
}
