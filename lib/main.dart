import 'package:flutter/material.dart';
import 'package:news_app/pages/home_page.dart';
import 'config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Gilroy',
          textTheme:
              TextTheme(bodyText2: TextStyle(fontWeight: FontWeight.w800)),
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black87),
            backgroundColor: Colors.transparent,
            titleTextStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 20),
            elevation: 0,
          )),
      darkTheme: ThemeData.dark(),
      themeMode: currentTheme.curentTheme(),
      debugShowCheckedModeBanner: false,
      title: 'News App',
      home: HomePage(),
    );
  }
}
