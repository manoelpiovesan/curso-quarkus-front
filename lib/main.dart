import 'package:flutter/material.dart';
import 'package:quarkus_front/views/homepage_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quarkus front',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF1A237E),
          secondary: const Color(0xFF1A237E),
        ),
        useMaterial3: false,
      ),
      home: const HomepageView(),
    );
  }
}
