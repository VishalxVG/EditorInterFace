// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TextState extends ChangeNotifier {
  String editedText = '';
  String selectedFont = 'Roboto';
  double selectedFontSize = 16.0;
  Color selectedFontColor = Colors.black;
  List<TextElement> texts = [];

  void addText() {
    texts.add(TextElement(
      text: editedText,
      selectedFont: selectedFont,
      selectedFontSiz: selectedFontSize,
      selectedFontColor: selectedFontColor,
    ));
    resetValues();
    notifyListeners();
  }

  void resetValues() {
    editedText = '';
    selectedFont = 'Roboto';
    selectedFontSize = 16.0;
    selectedFontColor = Colors.black;
    notifyListeners();
  }

  void updateText(String newText) {
    editedText = newText;
    notifyListeners();
  }

  void updatedFont(String newFont) {
    selectedFont = newFont;
    notifyListeners();
  }

  void updatedFontSize(double newSize) {
    selectedFontSize = newSize;
    notifyListeners();
  }

  void updateFontColor(Color newColor) {
    selectedFontColor = newColor;
    notifyListeners();
  }
}

// CLASS TO ADD ELEMENTS IN THE LIST
// WITH THEIR PROPERTIES

class TextElement {
  String text;
  String selectedFont;
  double selectedFontSiz;
  Color selectedFontColor;

  TextElement({
    required this.text,
    required this.selectedFont,
    required this.selectedFontSiz,
    required this.selectedFontColor,
  });
}

/*

When enter text ==>> update edited text
font ==>> update selectedFont
fSize ==>> update fSize
Fcolor ==>> update fColor

when clicked add text button ==>> TextElemet - add element



*/
