import 'dart:convert';

class HttpBodyPreparer {
  static String prepare(Map<String, dynamic> body) {
    body.remove('id');
    body.removeWhere((key, value) => value == null);

    final modifiedBody = json.encode(body);

    return modifiedBody;
  }
}
