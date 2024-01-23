// ignore_for_file: file_names

import 'package:editorapp/stateManagement/TextState.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

//TODO : ADD PHYSICAL ASSEST IN LOCAL DIRECTORY FOR FONTS AND THEN USE IT . USING HTTP FOR LOADING FONTS IS NOT WORKING

class CustomFontPicker extends StatefulWidget {
  const CustomFontPicker({super.key});

  @override
  State<CustomFontPicker> createState() => _CustomFontPickerState();
}

class _CustomFontPickerState extends State<CustomFontPicker> {
  String selectedFont = 'Roboto';

  Future<void> _showFontPickerDialog(
      BuildContext context, TextState textState) async {
    final List<String> requiredFonts = [
      'Roboto',
      'Open Sans',
      'Lato',
    ];
    List<String> availableFonts = GoogleFonts.asMap()
        .keys
        .where((font) => requiredFonts.contains(font))
        .toList();
    String? newFont = await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text(
                'Select a font',
              ),
              content: SizedBox(
                width: double.maxFinite,
                height: 500,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final font = availableFonts[index];
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            "Sample Text",
                            style: GoogleFonts.getFont(
                              font,
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                          ),
                          onTap: () {
                            textState.selectedFont = font;
                            Navigator.of(context).pop(font);
                          },
                        ),
                        const Divider(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ],
                    );
                  },
                  itemCount: availableFonts.length,
                ),
              ));
        });
    if (newFont != null) {
      setState(() {
        selectedFont = newFont;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.green),
        ),
        onPressed: () => _showFontPickerDialog(
          context,
          Provider.of<TextState>(context),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Provider.of<TextState>(context).selectedFont,
              style: const TextStyle(fontSize: 18),
            ),
            const Icon(
              Icons.arrow_drop_down,
              size: 35,
            ),
          ],
        ),
      ),
    );
  }
}
