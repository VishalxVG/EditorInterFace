import 'package:editorapp/pages/homePage.dart';
import 'package:editorapp/stateManagement/TextState.dart';
import 'package:editorapp/test/textHomePage.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TextState(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sample Editor',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
