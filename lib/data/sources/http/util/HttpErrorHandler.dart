import 'dart:convert';

import 'package:http/http.dart';

class HttpErrorHandler {
  static String defaultError = 'UNKNOWN_ERROR';

  static String handle(Response response) {
    final body = response.body;

    if (body.isEmpty) return defaultError;

    final Map<String, dynamic> data = json.decode(body);

    if (!data.containsKey('errors')) return defaultError;

    final List<dynamic> errors = data['errors'];

    if (errors.isEmpty) return defaultError;

    final List<String> messages =
        errors.map((e) => e['message'].toString()).toList();

    return messages.join('\n');
  }
}
