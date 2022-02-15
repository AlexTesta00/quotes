import 'package:flutter/material.dart';
import '../model/phrase.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Phrase ph = Phrase();

  @override
  Widget build(BuildContext context) {
    //Used to make responsive text
    double phoneWidth = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16),
                width: phoneWidth,
                child: Column(children: <Widget>[
                  SelectableText(
                    ph.getPhrase(),
                    textDirection: TextDirection.ltr,
                    style: GoogleFonts.bitter(fontSize: 24),
                    textAlign: TextAlign.center,
                    onTap: _changePhrase,
                  )
                ]),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SelectableText(
                  "~ ${ph.getAuthor()}",
                  textDirection: TextDirection.ltr,
                  style: GoogleFonts.permanentMarker(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _changePhrase() {
    setState(() {
      ph.getPhraseFromJson();
    });
  }
}
