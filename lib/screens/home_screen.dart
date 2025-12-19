//home_screen.dart
import 'package:flutter/material.dart';
import '../widgets/cardfeed.dart'; // ← IMPORT NECESARIO
import '../widgets/funcionesPaginas.dart';
import '../data/data.dart';
import '../widgets/estilosfunc.dart';
import '../widgets/login_form.dart';

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
      appBar: HomeScreen(context), // ← PASAMOS EL CONTEXT AQUÍ
      backgroundColor: Colors.grey[300],
      // importo desde cardfeed.dart
      // AQUI ESTA EL CONTENIDO QUE TIENE LA FOTO Y TEXTO
      // QUITO ESTO:
      // body: ListView.builder(
      // itemCount: listCard.length,
      // itemBuilder: (context,index){
      // return Cardfeed(
      //   estilosBotones: estilosBotones,
      //   card: listCard[index],
      // );
      // },
      // )
      // ✅ AGREGO ESTO:
      // Explicación:
      // - Uso Column para poder colocar el ListView arriba
      // y el botón "Siguiente" abajo.
      // - Uso Expanded para que el ListView ocupe todo el espacio disponible.
      body: Column( // ← AGREGO COLUMN PARA PODER AGREGAR MÁS WIDGETS
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded( // AGREGO EXPANDED PARA QUE EL LISTVIEW NO ROMPA EL LAYOUT
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
                  const SizedBox(width: 10), //  espacio entre los botones
                  Expanded(
                  child: BotonSiguiente(
                    nombreUrl: "AnamucPro",
                    url: "https://anamucpro.vercel.app",
                  ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                  child: BotonSiguiente(
                    nombreUrl: "FifaPro",
                    url: "https://fifaproapp.vercel.app",
                  ),
                  ),

                  // const SizedBox(width: 10),
                  // Expanded(
                  //   child: BotonSiguiente(
                  //     nombreUrl: "FifaPro",
                  //     url: "https://fifaproapp.vercel.app",
                  //   ),
                  // ),

                ],
              ),
            ),
          ) // FIN BOTONES PIE
        ],
      ),
      // desde aqui
      // hasta aqui
    );
  } // END

  /// AppBar separado
  AppBar HomeScreen(BuildContext context) { //  BuildContext context
    return AppBar(
      title: const Text(
        'GoTo.',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.green,
      actions: [
        // IconButton(
        //   icon: const Icon(Icons.login, color: Colors.white),
        //   tooltip: 'Iniciar Sesión',
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => const LoginPagina()),
        //     );
        //   },
        // ), //aqui boton para llamar otra pagina

        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPagina()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[800],           // Fondo azul
            minimumSize: const Size(60, 60),        // Tamaño cuadrado
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,      // Esquinas cuadradas
            ),
          ),
          child: const Text('Login', style: TextStyle(color: Colors.white)),
        ),





      ],
    );
  }
}// end