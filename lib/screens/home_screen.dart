import 'package:flutter/material.dart';
import 'package:translator/components/language_tile.dart';
import 'package:translator/components/translate.dart';
import 'package:translator/model/language_model.dart';
import 'package:translator/services/languages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  List<LanguageApi>? languages;

  Future getData() async {
    languages = await LanguagesApiCall().get();

    if (languages != null) {
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
                    LanguageTile(text: "Germany"),
                    Icon(
                      Icons.compare_arrows,
                      color: Colors.white,
                    ),
                    LanguageTile(text: "English"),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Translate From",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              TranslateBox(hint: "Enter Your Text"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Translate to",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TranslateBox(hint: "Enter Your Text"),
            ],
          ),
    );
  }
}
