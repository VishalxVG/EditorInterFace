// ignore_for_file: file_names

import 'package:editorapp/stateManagement/TextState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SizePickerWidget extends StatefulWidget {
  const SizePickerWidget({super.key});

  @override
  State<SizePickerWidget> createState() => _SizePickerWidgetState();
}

class _SizePickerWidgetState extends State<SizePickerWidget> {
  double selectedSize = 16.0;
  Future<void> _showTextSizePickerDialog(
      BuildContext context, TextState textState) async {
    final List<double> availableSizes = [
      8.0,
      10.0,
      12.0,
      16.0,
      18.0,
      20.0,
      24.0,
      28.0,
      30.0,
    ];

    double? newSize = await showDialog<double>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Text Size'),
          content: SizedBox(
            width: double.maxFinite,
            height: 500.0,
            child: ListView.builder(
              itemCount: availableSizes.length,
              itemBuilder: (context, index) {
                final size = availableSizes[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Font Size : $size',
                      ),
                      onTap: () {
                        textState.updatedFontSize(size);
                        Navigator.of(context).pop(size);
                      },
                    ),
                    const Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );

    if (newSize != null) {
      setState(() {
        selectedSize = newSize;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TextState>(
      builder: (context, textstate, _) {
        return SizedBox(
          width: 150,
          height: 50,
          child: ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.green),
            ),
            onPressed: () => _showTextSizePickerDialog(context, textstate),
            child: Text(
              "Text Size : ${textstate.selectedFontSize.toStringAsFixed(1)}",
              style: const TextStyle(fontSize: 17),
            ),
          ),
        );
      },
    );
  }
}