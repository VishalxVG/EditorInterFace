// ignore_for_file: file_names

import 'package:editorapp/components/customButton.dart';
import 'package:editorapp/pages/addTextPage.dart';
import 'package:editorapp/stateManagement/TextState.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 17, 86, 155),
        title: const Text(
          "Image Editor",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _undoRedoButton(),
            const SizedBox(
              height: 10,
            ),
            //* TEXT TO BE PUT HERE
            _canvasContainer()
          ],
        ),
      ),
      floatingActionButton: CustomButton(
        buttonText: "Add Text",
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTextPage()));
        },
      ),
    );
  }

  Container _canvasContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: 720,
      child: Consumer<TextState>(
        builder: (context, textstate, _) {
          return Stack(
            children: [
              ListView.builder(
                itemCount: textstate.texts.length,
                itemBuilder: (context, index) {
                  final textElement = textstate.texts[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      left: textElement.position.dx,
                      top: textElement.position.dy,
                    ),
                    child: Draggable(
                      data: textElement,
                      feedback: Text(
                        textElement.text,
                        style: TextStyle(
                          fontSize: textElement.selectedFontSiz,
                          fontWeight: FontWeight.w500,
                          color: textElement.selectedFontColor,
                        ),
                      ),
                      childWhenDragging: Container(),
                      child: Text(
                        textElement.text,
                        style: TextStyle(
                          fontSize: textElement.selectedFontSiz,
                          fontWeight: FontWeight.w500,
                          color: textElement.selectedFontColor,
                        ),
                      ),
                      onDragEnd: (details) {
                        textstate.updateTextPosition(
                            textElement, details.offset);
                      },
                    ),
                  );
                },
              ),
              Positioned(
                top: 0,
                right: 0,
                child: DragTarget<TextElement>(
                  onWillAccept: (data) => true,
                  onAccept: (data) {
                    textstate.deleteTextElement(data);
                  },
                  builder: (context, candidateData, rejectedData) {
                    return Container(
                      width: 50,
                      height: 50,
                      color: Colors.red, // Customize the color as needed
                      child: const Icon(Icons.delete),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Row _undoRedoButton() {
    return Row(
      children: [
        CustomButton(
          onTap: () {},
          buttonText: "Undo",
          buttonIcon: const Icon(Icons.undo),
        ),
        const SizedBox(
          width: 10,
        ),
        CustomButton(
          onTap: () {},
          buttonText: "Redo",
          buttonIcon: const Icon(Icons.redo),
        ),
      ],
    );
  }
}
