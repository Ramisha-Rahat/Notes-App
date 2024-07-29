import 'package:flutter/material.dart';
import 'package:noteapp/models/note_database.dart';
import 'package:noteapp/pages/login.dart';
import 'package:noteapp/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialized();

  // runApp(
  //   ChangeNotifierProvider(
  //     create: (context) => NoteDatabase(),
  //     child: const MyApp(),
  //   ),
  // );
  
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider( create: (context) => NoteDatabase(),),
      ChangeNotifierProvider(create: (context)=> ThemeProvider(),),
    ],
    child: const MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: MyLoginPage(),
       // home: MyHomePage(),
    );
  }
}