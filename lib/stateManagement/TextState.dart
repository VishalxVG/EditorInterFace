// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TextState extends ChangeNotifier {
  String editedText = '';
  String selectedFont = 'Roboto';
  double selectedFontSize = 16.0;
  Color selectedFontColor = Colors.black;

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
