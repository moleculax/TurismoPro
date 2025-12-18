//cardfeed.dart
import 'package:flutter/material.dart';
import 'package:app_movil/widgets/funcionesPaginas.dart';
import 'package:app_movil/widgets/textosfeed.dart';
import '../widgets/estilosfunc.dart';

class Cardfeed extends StatelessWidget {
  const Cardfeed({
    super.key,
    required this.estilosBotones,
    this.card,
  });

  final TextStyle estilosBotones;
  final Map<String,String>? card;

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
            ImageCard(
              card?["image"] ?? "Sin image",
            ),

            /// --- HAGO LLAMDO A FUNCION QUE TIENE LOS BOTONES ---
            ///  el estilo de los botones  esta en el archivo: home_screen.dart
            ///  aunque se pueden definir otros y pasarlos a la funcion
            BottonCard(estilosBotones),

          ],
        ),

      ),
    );

  }
} // END class
