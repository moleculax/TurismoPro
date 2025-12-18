
import 'package:flutter/material.dart';
// Importo
import 'package:app_movil/screens/home_screen.dart';


void main() => runApp(const MyApp());


/// Widget raíz de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TurismoPro',
      debugShowCheckedModeBanner: false, // Oculta la barra diagonal debug
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),

      // VIENE DE home_screen.dart
      home: const HomePage(),



    );
  }
}


