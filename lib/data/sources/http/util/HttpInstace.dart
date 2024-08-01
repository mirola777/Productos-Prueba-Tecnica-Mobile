import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class HttpInstance {
  static final HttpInstance _instance = HttpInstance._internal();

  final String baseUrl = dotenv.env['BACKEND_URL'] ?? '';

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  factory HttpInstance() {
    return _instance;
  }

  HttpInstance._internal();

  Future<http.Response> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');

    return await http.get(url, headers: headers);
  }

  Future<http.Response> post(String endpoint, {dynamic body}) async {
    final url = Uri.parse('$baseUrl$endpoint');

    return await http.post(url, headers: headers, body: body);
  }

  Future<http.Response> put(String endpoint, {dynamic body}) async {
    final url = Uri.parse('$baseUrl$endpoint');

    return await http.put(url, headers: headers, body: body);
  }

  Future<http.Response> delete(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');

    return await http.delete(url, headers: headers);
  }
}
