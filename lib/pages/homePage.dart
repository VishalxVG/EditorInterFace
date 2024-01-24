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
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 98, 33),
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
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              height: 720,
            ),
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

  Row _undoRedoButton() {
    return Row(
      children: [
        CustomButton(
          onTap: () {
            if (Provider.of<TextState>(context, listen: false).texts.isEmpty) {
              print("List is empty");
            } else {
              print("List is not empty");
            }
          },
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
