// login_form.dart
import 'package:flutter/material.dart'; // ← Widgets básicos de Flutter
import 'package:http/http.dart' as http;   // ← Para hacer peticiones HTTP al endpoint
import 'dart:convert';                     // ← Para convertir datos a JSON

class LoginPagina extends StatefulWidget { // ← Stateful porque manejamos controllers y estado de respuesta
  const LoginPagina({super.key});

  @override
  State<LoginPagina> createState() => _LoginPaginaState();
}

class _LoginPaginaState extends State<LoginPagina> {
  final _email = TextEditingController(); // ← Controla el campo de email
  final _pass = TextEditingController();  // ← Controla el campo de contraseña

  Map<String, dynamic> _responseData = {}; // ← Guarda TODO el objeto JSON recibido del servidor (éxito o error)
  String _mensaje = '';                    // ← Mensaje de éxito o error para mostrar al usuario
  bool _cargando = false;                  // ← Indica si está cargando la petición (para mostrar spinner)

  // ← Función que envía email y contraseña al endpoint
  void _login() async {
    final email = _email.text.trim(); // ← Obtiene el email y elimina espacios al inicio/final
    final pass = _pass.text;          // ← Obtiene la contraseña tal cual

    // ← Validación básica: si falta algún campo, muestra mensaje y no envía
    if (email.isEmpty || pass.isEmpty) {
      setState(() => _mensaje = 'Por favor completa ambos campos');
      return;
    }

    // ← Prepara la UI para la carga
    setState(() {
      _cargando = true;
      _mensaje = '';
      _responseData = {}; // ← Limpia cualquier respuesta anterior
    });

    try {
      // ← Realiza la petición POST al endpoint
      final response = await http.post(
        Uri.parse('https://backend-hotelpro.onrender.com/api/usuarios/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': pass}),
      );

      // ← Convierte el cuerpo de la respuesta a un Map (objeto JSON)
      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // ← Login exitoso: guarda todo el objeto recibido
        setState(() {
          _responseData = data;           // ← Aquí está TODO lo que devolvió el backend
          _mensaje = '¡Login exitoso!';
        });
      } else {
        // ← Error del servidor (credenciales incorrectas, etc.): también muestra el objeto
        setState(() {
          _responseData = data;
          _mensaje = data['message'] ?? 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      // ← Error de conexión (sin internet, servidor caído, etc.)
      setState(() {
        _mensaje = 'Error de conexión. Verifica tu internet.';
      });
    } finally {
      // ← Siempre se ejecuta: quita el indicador de carga
      setState(() => _cargando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green, // ← Fondo verde para toda la página
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.green[800], // ← AppBar en tono más oscuro para mejor contraste
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ← Campo de email
            TextField(
              controller: _email,
              decoration: const InputDecoration(
                labelText: "Email",
                filled: true,       // ← Fondo blanco para que se lea bien sobre el verde
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

            // ← Campo de contraseña
            TextField(
              controller: _pass,
              obscureText: true,    // ← Oculta el texto (•••••)
              decoration: const InputDecoration(
                labelText: "Contraseña",
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 24),

            // ← Botón con indicador de carga
            _cargando
                ? const CircularProgressIndicator(color: Colors.white)
                : ElevatedButton(
              onPressed: _login, // ← Ejecuta la función de login
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.green,
              ),
              child: const Text("Ingresar"),
            ),

            const SizedBox(height: 20),

            // ← Muestra mensaje de éxito o error
            if (_mensaje.isNotEmpty)
              Text(
                _mensaje,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),

            const SizedBox(height: 20),

            // ← MUESTRA TODO EL OBJETO JSON RECIBIDO DEL ENDPOINT
            if (_responseData.isNotEmpty)
              Expanded( // ← Permite scroll si el JSON es largo
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SelectableText(
                      // ← Formatea el JSON con indentación para que sea legible
                      const JsonEncoder.withIndent('  ').convert(_responseData),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'monospace', // ← Fuente monoespaciada para alineación perfecta
                        height: 1.5,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _email.dispose(); // ← Libera memoria del controller de email
    _pass.dispose();  // ← Libera memoria del controller de contraseña
    super.dispose();  // ← Llama al dispose de la clase padre (obligatorio)
  }
}