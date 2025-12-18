
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';



class SegundaPagina extends StatefulWidget {
  final String url; // ← DECLARACIÓN DEL PARÁMETRO

  const SegundaPagina({super.key, required this.url}); // ← CONSTRUCTOR CORRECTO

  @override
  State<SegundaPagina> createState() => _SegundaPaginaState();
}

class _SegundaPaginaState extends State<SegundaPagina> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(widget.url), // ← AHORA USA LA URL RECIBIDA
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Home",
          style: TextStyle(
            color: Colors.white, // ← LETRA BLANCA
          ),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }



}


// class SegundaPagina extends StatefulWidget {
//   const SegundaPagina({super.key});
//
//   @override
//   State<SegundaPagina> createState() => _SegundaPaginaState();
// }
//
// class _SegundaPaginaState extends State<SegundaPagina> {
//   late final WebViewController controller;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Inicializa el controlador del WebView
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted) // habilita JS
//       ..loadRequest(
//         Uri.parse("https://moleculaxapp.vercel.app"), // <<--- tu URL
//       );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Segunda Página")),
//       body: WebViewWidget(controller: controller),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class SegundaPagina extends StatelessWidget {
//   const SegundaPagina({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Segunda Página")),
//       body: const Center(
//         child: Text("llegaste a la segunda página."),
//       ),
//     );
//   }
// }