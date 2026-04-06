import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

// Importa o arquivo login.dart que está na mesma pasta (lib)
import 'login.dart'; 

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, 
      // Tiramos o MultiProvider temporariamente para não dar erro
      builder: (context) => const FixItApp(),
    ),
  );
}

class FixItApp extends StatelessWidget {
  const FixItApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'FixIt',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      // Chama a tela que você criou no arquivo login.dart
      home: const Login(), 
    );
  }
}