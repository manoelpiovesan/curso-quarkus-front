import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quarkus_front/views/homepage_view.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    getWindowInfo().then((PlatformWindow window) {
      if (window.screen != null) {
        setWindowMinSize(const Size(500, 800));
        setWindowFrame(
          Rect.fromCenter(
            center: window.screen!.visibleFrame.center,
            width: 500,
            height: 800,
          ),
        );
        setWindowMaxSize(Size.infinite);
        setWindowTitle('Aponta Fácil');
      }
    });
  }

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
