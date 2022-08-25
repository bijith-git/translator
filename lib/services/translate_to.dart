import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:translatorapp/model/language_model.dart';

class LanguagesApiCall {
  static const String _baseUrl = 'google-translate1.p.rapidapi.com';

  static const Map<String, String> _headers = {
    "content-type": "application/x-www-form-urlencoded",
    "Accept-Encoding": "application/gzip",
    "X-RapidAPI-Key": "67d14c7c3dmsh93590b2415a279dp13c1fdjsna01136e0461b",
    "X-RapidAPI-Host": "google-translate1.p.rapidapi.com",
    "useQueryString": "true"
  };

  Future post(Map data) async {
    Uri uri = Uri.https(_baseUrl, "/language/translate/v2");
    final response = await http.post(uri, headers: _headers, body: data);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // final languageModel = languageModelToJson(response.body);
      // print(languageModel);
      return languageModelToJson(data);
    } else {
      print("not success");
      throw Exception('Failed to load json data');
    }
  }
}
