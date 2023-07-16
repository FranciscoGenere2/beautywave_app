import 'package:flutter/material.dart';
import 'package:beautywave/home_page.dart';
import 'package:beautywave/login_page.dart';
import 'package:beautywave/settings_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'BeautyWave';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const MyHomePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/settings') {
          return MaterialPageRoute(
            builder: (context) => const SettingsPage(),
          );
        }
      },
    );
  }
}
