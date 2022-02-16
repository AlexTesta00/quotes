import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:http/http.dart' as http;

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

  Future<void> getPhraseFromJsonOnline(Uri url) async {
    final response = await http.get(url);
    final source = const Utf8Decoder().convert(response.bodyBytes);
    if (response.statusCode == 200) {
      final data = await json.decode(source);
      int randNumber = Random().nextInt(source.split("text").length - 1);
      setAuthor(data["phrase"][randNumber]["author"]);
      setPhrase(data["phrase"][randNumber]["text"]);
    }
  }
}
