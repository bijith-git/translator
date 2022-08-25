import 'package:flutter/material.dart';
import 'package:translatorapp/components/language_tile.dart';
import 'package:translatorapp/components/translate.dart';
import 'package:translatorapp/model/language_model.dart';
import 'package:translatorapp/services/languages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;

  TextEditingController translateto = TextEditingController();
  TextEditingController translatefrom = TextEditingController();

  @override
  void initState() {
    super.initState();
    // getData();
  }

  List<LanguageModel>? languagelist;

  Future<List<LanguageModel>?> getData() async {
    languagelist = await LanguagesApiCall().get();
    if (languagelist != null) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(.5),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black.withOpacity(.5),
          title: const Text(
            'Text Translator',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        LanguageTile(text: 'language'),
                        Icon(
                          Icons.compare_arrows,
                          color: Colors.white,
                        ),
                        LanguageTile(text: "English"),
                      ],
                    ),
                  ),
                  TranslateBox(),
                ],
              ));
  }
}
