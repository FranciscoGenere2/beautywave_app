import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();

  Future<void> register(BuildContext context) async {
    String nombre = nombreController.text;
    String correo = correoController.text;
    String contrasena = contrasenaController.text;

    // Establecer la conexión con la base de datos
    final conn = await MySqlConnection.connect(
      ConnectionSettings(
        host: 'db4free.net',
        port: 3306,
        user: 'franwave',
        password: 'franwave',
        db: 'beautywave',
      ),
    );

    // Insertar los datos en la tabla 'usuarios'
    await conn.query(
      'INSERT INTO usuarios (nombre, correo, contra, rol) VALUES (?, ?, ?, ?)',
      [nombre, correo, contrasena, 2],
    );

    // Cerrar la conexión
    await conn.close();

    // Mostrar un diálogo con los datos registrados
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registro exitoso'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nombre: $nombre'),
              Text('Contraseña: $contrasena'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Registro'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Completa el formulario de registro',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: correoController,
              decoration: const InputDecoration(
                labelText: 'Correo electrónico',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: contrasenaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                register(context); // Lógica de registro
              },
              child: const Text('Registrarse'),
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                text: '¿Ya tienes una cuenta? ',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Inicia sesión',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context,
                            '/'); // Navegar a la página de inicio de sesión
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
