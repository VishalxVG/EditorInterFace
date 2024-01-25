// ignore_for_file: file_names

import 'package:editorapp/stateManagement/TextState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class ColorPickerWidget extends StatefulWidget {
  const ColorPickerWidget({super.key});

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  Color pickerColor = Colors.black;
  Color currentColor = Colors.black;

  void changeColor(Color color) {
    setState(() {
      pickerColor = color;
    });
  }

  Future<void> _showFontColorDialog(
      BuildContext context, TextState textState) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Pick a color"),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: pickerColor,
                onColorChanged: changeColor,
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentColor = pickerColor;
                  });
                  textState.updateFontColor(currentColor);
                  Navigator.of(context).pop();
                },
                child: const Text("Got it"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 150,
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            Color.fromARGB(255, 105, 172, 239),
          ),
        ),
        onPressed: () => _showFontColorDialog(
          context,
          Provider.of<TextState>(context, listen: false),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Color",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Container(
              height: 20,
              width: 20,
              color: currentColor,
            )
          ],
        ),
      ),
    );
  }
}
