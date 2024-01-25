// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TextState extends ChangeNotifier {
  String editedText = '';
  String selectedFont = 'Roboto';
  double selectedFontSize = 16.0;
  Color selectedFontColor = Colors.black;

  List<TextElement> texts = [];

  void addText() {
    print(
      'Adding text: $editedText, Font: $selectedFont, Size: $selectedFontSize, Color: $selectedFontColor',
    );
    texts.add(TextElement(
      text: editedText,
      selectedFont: selectedFont,
      selectedFontSiz: selectedFontSize,
      selectedFontColor: selectedFontColor,
      position: const Offset(50, 100),
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

  void updateTextPosition(TextElement textElement, Offset newPosition) {
    final index = texts.indexOf(textElement);
    if (index != -1) {
      texts[index] = TextElement(
        text: textElement.text,
        selectedFont: textElement.selectedFont,
        selectedFontSiz: textElement.selectedFontSiz,
        selectedFontColor: textElement.selectedFontColor,
        position: newPosition,
      );
      notifyListeners();
    }
  }
}

// CLASS TO ADD ELEMENTS IN THE LIST
// WITH THEIR PROPERTIES

class TextElement {
  String text;
  String selectedFont;
  double selectedFontSiz;
  Color selectedFontColor;
  Offset position;

  TextElement({
    required this.text,
    required this.selectedFont,
    required this.selectedFontSiz,
    required this.selectedFontColor,
    required this.position,
  });
}
