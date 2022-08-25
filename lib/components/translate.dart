// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:translator/translator.dart';

class TranslateBox extends StatefulWidget {
  const TranslateBox({
    Key? key,
  }) : super(key: key);

  @override
  State<TranslateBox> createState() => _TranslateBoxState();
}

class _TranslateBoxState extends State<TranslateBox> {
  String txtdata = "Your Text";
  final translator = GoogleTranslator();
  Future translateData(String txt) async {
    var translation = await translator.translate(txt, to: 'es');
    print(translation);
    setState(() {
      txtdata = translation.text;
    });
    return translation;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController txt = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.6),
                borderRadius: BorderRadius.circular(20)),
            child: TextField(
              scrollPadding: EdgeInsets.all(30),
              maxLines: 5,
              onChanged: (Text) {
                setState(() {
                  translateData(Text);
                });
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter your Text here",
                  hintStyle: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Translate to",
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white),
          ),
        ),
        Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.6),
                borderRadius: BorderRadius.circular(20)),
            child: Text(txtdata))
      ],
    );
  }
}
