//home_screen.dart
import 'package:flutter/material.dart';
import '../widgets/cardfeed.dart'; // ← IMPORT NECESARIO
import '../widgets/funcionesPaginas.dart';
import '../data/data.dart';
import '../widgets/estilosfunc.dart';


/// Pantalla principal
class HomePage extends StatelessWidget { // ← WIDGET (StatelessWidget)
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    // Estilo reutilizable para los botones (NO es widget, es un objeto TextStyle)
    const estilosBotones = TextStyle(
      color: Colors.grey,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );

    return Scaffold( // ← WIDGET
      appBar: HomeScreen(), // ← WIDGET (AppBar)
      backgroundColor: Colors.grey[300],
      // importo desde cardfeed.dart
      // AQUI ESTA EL CONTENIDO QUE TIENE LA FOTO Y TEXTO

      // ❌ QUITO ESTO:
      // body: ListView.builder(
      //   itemCount: listCard.length,
      //   itemBuilder: (context,index){
      //     return Cardfeed(
      //       estilosBotones: estilosBotones,
      //       card: listCard[index],
      //     );
      //   },
      // )

      // ✅ AGREGO ESTO:
      // Explicación:
      // - Uso Column para poder colocar el ListView arriba
      //   y el botón "Siguiente" abajo.
      // - Uso Expanded para que el ListView ocupe todo el espacio disponible.
      body: Column( // ← AGREGO COLUMN PARA PODER AGREGAR MÁS WIDGETS
        mainAxisSize: MainAxisSize.max,
        children: [

          Expanded( // ← AGREGO EXPANDED PARA QUE EL LISTVIEW NO ROMPA EL LAYOUT
            child: ListView.builder(
              itemCount: listCard.length,
              itemBuilder: (context,index){
                return Cardfeed(
                  estilosBotones: estilosBotones,
                  card: listCard[index],
                );
              },
            ),
          ),

          /// ------------------------------------------------------------
          /// AGREGO EL BOTÓN SIGUIENTE DEBAJO DEL FEED
          /// ------------------------------------------------------------




          // INICIO BOTONES PIE
          Container(
            color: Colors.green, // ← FONDO VERDE
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50), // ← SUBE EL BLOQUE
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // ← CENTRA LOS BOTONES
                children: [
                  Expanded(
                    child: BotonSiguiente(
                      nombreUrl: "MoleculaX",
                      url: "http://moleculaxapp.vercel.app",
                    ),
                  ),

                  const SizedBox(width: 20), // ← ESPACIO ENTRE BOTONES

                  // Expanded(
                  //   child: BotonSiguiente(
                  //     nombreUrl: "Pedraza",
                  //     url: "https://pedraza.com.ar",
                  //   ),
                  // ),

                  const SizedBox(width: 20),
                  //
                  // Expanded(
                  //   child: BotonSiguiente(
                  //     nombreUrl: "Turismo City",
                  //     url: "https://www.turismocity.com.ar/",
                  //   ),
                  // ),
                ],
              ),
            ),
          )


          // FIN BOTONES PIE

        ],
      ),
    );
  } // END

  /// AppBar separado
  AppBar HomeScreen() { // ← WIDGET (AppBar)
    return AppBar( // ← WIDGET
      title: const Text( // ← WIDGET
        'GoTo.', // BARRA SUPERIOR
        style: TextStyle(
          color: Colors.white, // ← TEXTO BLANCO
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.green,
    );
  }
}
