import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  String _selectedLanguage = 'Español';
  List<String> _languages = ['Español', 'Inglés', 'Francés'];

  void _toggleNotifications(bool value) {
    setState(() {
      _notificationsEnabled = value;
    });
  }

  void _changeLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Configuración de Usuario',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Notificaciones'),
              trailing: Switch(
                value: _notificationsEnabled,
                onChanged: _toggleNotifications,
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text('Idioma'),
              subtitle: Text(_selectedLanguage),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Seleccionar Idioma'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: _languages.map((language) {
                            return ListTile(
                              title: Text(language),
                              onTap: () {
                                _changeLanguage(language);
                                Navigator.of(context).pop();
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () {
                // Lógica para cerrar sesión aquí
                // Por ahora, simplemente navegaremos de regreso a la pantalla de inicio de sesión
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text('Cerrar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
