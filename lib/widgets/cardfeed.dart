//cardfeed.dart
import 'package:flutter/material.dart';
import 'package:app_movil/widgets/funcionesPaginas.dart';
import 'package:app_movil/widgets/textosfeed.dart';
import '../widgets/estilosfunc.dart';

class Cardfeed extends StatelessWidget {
  const Cardfeed({
    super.key,
    required this.estilosBotones,
    required this.card,
  });

  final TextStyle estilosBotones;
  //final Map<String,String>? card;
  final Map<String, dynamic> card;


  @override
  Widget build(BuildContext context) {
    return Container( // ← WIDGET
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),

      child: Padding( // ← WIDGET
        padding: const EdgeInsets.all(10),

        child: Column( // ← WIDGET
          children: [
            /// --- CABECERA DEL POST ---
            //AvatarCard(),
            AvatarCard(
              card?["name"] ?? "Sin nombre", // ← FIX DEFINITIVO
            ),

            /// --- TEXTO DEL POST ---
            DescriptionCard(
                card?["texto"] ?? "Sin Texto",
            ), // FUNCION QUE CONTIENE EL TEXTO QUE MUESTRA LA PRIMERA LINEA

            /// --- LLAMADO A FUNCION CON IMAGEN ---
            // ImageCard(
            //   card?["image"] ?? "Sin image",
            // ),

            // ImageCard(
            //   card["image"].toString().startsWith("http")
            //       ? card["image"]                         // URL remota
            //       : "assets/image/${card["image"]}",      // Imagen local
            // ),
            Image(
              // Selecciona dinámicamente el tipo de imagen según el contenido del campo "image".
              image: card["image"].toString().startsWith("http")
              // Si la cadena empieza con "http", se asume que es una URL remota.
                  ? NetworkImage(card["image"])
              // Si no empieza con "http", se carga como un asset local dentro de assets/image/.
                  : AssetImage("assets/image/${card["image"]}"),

              // Ajusta la imagen para que cubra todo el espacio disponible sin deformarse.
              fit: BoxFit.cover,
            ),



            /// --- HAGO LLAMDO A FUNCION QUE TIENE LOS BOTONES ---
            ///  el estilo de los botones  esta en el archivo: home_screen.dart
            ///  aunque se pueden definir otros y pasarlos a la funcion
            // BottonCard(estilosBotones),
            BottonCard(
              estilosBotones: estilosBotones,
              name: card["name"],
              texto: card["texto"],
            ),

          ],
        ),

      ),
    );

  }
} // END class
