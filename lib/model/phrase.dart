import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:math';

class Phrase {
  String _text = "Ciò che non ti uccide ti rende più forte";
  String _author = "Friedrich Nietzsche";

  Phrase() {
    getPhraseFromJson();
  }

  String getAuthor() {
    return _author;
  }

  String getPhrase() {
    return _text;
  }

  void setAuthor(String phrase) => {_author = phrase};

  void setPhrase(String author) => {_text = author};

  Future<void> getPhraseFromJson() async {
    final String response = await rootBundle.loadString('assets/phrase.json');
    final data = await json.decode(response);
    int randNumber = Random().nextInt(response.split("text").length - 1);
    setAuthor(data["phrase"][randNumber]["author"]);
    setPhrase(data["phrase"][randNumber]["text"]);
  }
}
