import 'package:flutter/material.dart';
import 'estilosfunc.dart';
// ← IMPORT NECESARIO PARA NAVEGAR A LA SEGUNDA PÁGINA
import '../screens//segunda_pagina.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// AJUSTA LA RUTA SEGÚN TU PROYECTO

Row BottonCard(TextStyle estilosBotones) {
  return Row( // ← WIDGET
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      TextButton( // ← WIDGET
        onPressed: () {},
        child: Text("Me Gusta", style: estilosBotones), // ← FIX: sin const
      ),
      TextButton( // ← WIDGET
        onPressed: () {},
        child: Text("Comentar", style: estilosBotones), // ← FIX
      ),
      TextButton( // ← WIDGET
        onPressed: () {},
        child: Text("Compartir", style: estilosBotones), // ← FIX
      ),
    ],
  );
}




/// ------------------------------------------------------------
/// NUEVA FUNCIÓN: imagenSecundaria()
/// ------------------------------------------------------------
SizedBox imagenSecundaria() { // ← NUEVA FUNCIÓN
  return SizedBox( // ← WIDGET
    width: double.infinity,
    height: 200,
    child: Image.network( // ← WIDGET
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcIBlpLXw_Ho7j2KoghYK1qj8Fttu3lfFFLA&s",
      fit: BoxFit.cover,
    ),
  );
}


SizedBox ImageCard(String image) {
 return SizedBox( width: double.infinity,
  height: 200,
  child: Image.network( // ← WIDGET
      image,
      fit: BoxFit.cover,
  ),
  );
} // ← WIDGET






/// ------------------------------------------------------------
/// WIDGET: Botón Siguiente
/// Recibe una URL y navega a SegundaPagina(url)
/// ------------------------------------------------------------
class BotonSiguiente extends StatelessWidget {
  final String nombreUrl; // ← NOMBRE DEL BOTÓN
  final String url;       // ← URL A ABRIR

  const BotonSiguiente({
    super.key,
    required this.nombreUrl,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SegundaPagina(url: url),
              ),
            );
          },
          icon: const Icon(Icons.arrow_forward),
          label: Text(nombreUrl), // ← SE MUESTRA EL NOMBRE
        ),
      ],
    );
  }
}








