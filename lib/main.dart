import 'package:flutter/material.dart';
import 'package:metarizz_assignment/pallete.dart';
import 'package:metarizz_assignment/app_route.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(
        ThemeData(
          useMaterial3: true,
          fontFamily: 'Inter',
          scaffoldBackgroundColor: Pallete.darkBackgroundColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: Pallete.darkBackgroundColor,
          ),
        ),
        Pallete.darkInformationCardColor,
        Pallete.informationCardTextColor2,
        Pallete.paragraphTextColor2,
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showSearchScreen = false;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      theme: themeNotifier.getTheme(),
      debugShowCheckedModeBanner: false,
      title: 'Metarizz Assignment',
      home: const AppRoute(),
    );
  }
}
