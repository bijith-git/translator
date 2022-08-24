class LanguageApi {
  final String language;

  LanguageApi({
    required this.language,
  });

  factory LanguageApi.formJson(dynamic json) {
    return LanguageApi(
      language: json['language'] as String,
    );
  }

  static List<LanguageApi> languagesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return LanguageApi.formJson(data);
    }).toList();
  }
}
