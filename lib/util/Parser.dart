class Parser {
  static String parseString(dynamic value) {
    if (value is String) return value;

    try {
      return value.toString();
    } catch (e) {
      return '';
    }
  }

  static int parseInt(dynamic value) {
    if (value is int) return value;

    try {
      return int.tryParse(value.toString()) ?? 0;
    } catch (e) {
      return 0;
    }
  }

  static double parseDouble(dynamic value) {
    if (value is double) return value;

    try {
      return double.tryParse(value.toString()) ?? 0.0;
    } catch (e) {
      return 0.0;
    }
  }
}
