import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

// http client with token

class HttpClient {
  final box = GetStorage();

  Map<String, String> getHeaders() {
    var token = box.read('api_key') as String?;

    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };

    return headers;
  }

  Future<http.Response> get(String url) async {
    return await http.get(Uri.parse(url), headers: getHeaders());
  }

  Future<http.Response> post(String url, dynamic body) async {
    return await http.post(Uri.parse(url), headers: getHeaders(), body: body);
  }

  Future<http.Response> put(String url, dynamic body) async {
    return await http.put(Uri.parse(url), headers: getHeaders(), body: body);
  }

  Future<http.Response> delete(String url) async {
    return await http.delete(Uri.parse(url), headers: getHeaders());
  }
}

final HttpClient httpClient = HttpClient();
