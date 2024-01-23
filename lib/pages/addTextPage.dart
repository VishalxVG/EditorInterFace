// ignore_for_file: non_constant_identifier_names, file_names

import 'package:editorapp/components/colorPickerWidget.dart';
import 'package:editorapp/components/customButton.dart';
import 'package:editorapp/components/customFontPicker.dart';
import 'package:editorapp/components/sizePickerButton.dart';
import 'package:editorapp/stateManagement/TextState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTextPage extends StatefulWidget {
  const AddTextPage({super.key});

  @override
  State<AddTextPage> createState() => _AddTextPageState();
}

class _AddTextPageState extends State<AddTextPage> {
  TextEditingController _controller = TextEditingController();
  String editedText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 98, 33),
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
              onTap: () {},
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
            controller: _controller,
            onChanged: (value) {
              //! Updating the text using the textstate update text function
              Provider.of<TextState>(context, listen: false).updateText(value);
            },
            decoration: InputDecoration(
              hintText: "Enter a Text ",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade500,
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
              _controller.text = textState.editedText;
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
