import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:translator/model/language_model.dart';

class LanguagesApiCall {
  static const String _baseUrl = 'google-translate1.p.rapidapi.com';

  static const Map<String, String> _headers = {
    'Accept-Encoding': 'application/gzip',
    'X-RapidAPI-Key': '45d63820e6msh3ee3afca185e086p15e1fdjsn326a0b98a3c9',
    'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com'
  };

  Future get() async {
    Uri uri = Uri.https(_baseUrl, "/language/translate/v2/languages");
    final response = await http.get(uri, headers: _headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return LanguageModel.fromJson(data);
    } else {
      print("not success");
      throw Exception('Failed to load json data');
    }
  }
}
