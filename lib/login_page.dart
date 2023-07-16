import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'database_connection.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  Future<void> verifyConnection(BuildContext context) async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Verificando conexión...'),
        duration: const Duration(seconds: 3),
      ),
    );

    try {
      final connection = await getConnection();
      // La conexión se estableció correctamente
      print('Conexión exitosa');
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Conexión exitosa'),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 3),
        ),
      );
      // Puedes cerrar la conexión si no la necesitas más
      await connection.close();
    } catch (e) {
      // Ocurrió un error al establecer la conexión
      print('Error de conexión a la base de datos: $e');
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Error de conexión a la base de datos'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Iniciar sesión'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ingresa tus credenciales',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Correo electrónico',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Lógica de inicio de sesión aquí
                // Por ahora, simplemente navegaremos a la página principal
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text('Iniciar sesión'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => verifyConnection(context),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child: const Text('Verificar conexión'),
            ),
            const SizedBox(height: 16),
            RichText(
              text: TextSpan(
                text: '¿No tienes una cuenta? ',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Regístrate',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, '/register');
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
