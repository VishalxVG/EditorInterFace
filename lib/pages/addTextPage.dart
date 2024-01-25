// ignore_for_file: non_constant_identifier_names, file_names

import 'package:editorapp/components/colorPickerWidget.dart';
import 'package:editorapp/components/customButton.dart';
import 'package:editorapp/components/customFontPicker.dart';
import 'package:editorapp/components/sizePickerButton.dart';

import 'package:editorapp/stateManagement/TextState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTextPage extends StatefulWidget {
  final String? addText;
  const AddTextPage({
    super.key,
    this.addText,
  });

  @override
  State<AddTextPage> createState() => _AddTextPageState();
}

class _AddTextPageState extends State<AddTextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 86, 155),
        title: const Text("Add Text Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _UpperBox(),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: CustomButton(
              buttonText: "Add Text",
              onTap: () {
                Provider.of<TextState>(context, listen: false).addText();

                Future.delayed(Duration.zero, () {
                  Navigator.of(context).pop();
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Container _UpperBox() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
//* --------------------------------------------------------------------------------------

          //* TEXT FIELD FOR ENTERING TEXT
          TextField(
            onSubmitted: (value) {
              Provider.of<TextState>(context, listen: false).updateText(value);
            },
            decoration: InputDecoration(
              hintText: "Enter a Text ",
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                ),
              ),
              filled: true,
            ),
          ),
          const SizedBox(
            height: 20,
          ),

//* ------------------------------------------------------------------------------------------

          //* FONT  BUTTON

          const Text(
            "\tFont",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomFontPicker(),

//* --------------------------------------------------------------------------------------------

          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//*------------------------------------------------------------------------

                  //* SIZE BUTTON
                  Text(
                    "\tSize",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizePickerWidget(),
                ],
              ),
//*---------------------------------------------------------------------------

              //* COLOR BUTTON
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\tColor",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ColorPickerWidget(),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
//*------------------------------------------------------------------------------------
          //* Changed Text After Getting updated
          Consumer<TextState>(
            builder: (context, textState, _) {
              print("Consumer is getting rebuilt");

              return SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    textState.editedText,
                    style: TextStyle(
                      fontSize: textState.selectedFontSize,
                      fontWeight: FontWeight.w500,
                      color: textState.selectedFontColor,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
