import 'package:mysql1/mysql1.dart';

Future<MySqlConnection> getConnection() async {
  final settings = ConnectionSettings(
    host: 'db4free.net',
    port: 3306,
    user: 'franwave',
    password: 'franwave',
    db: 'beautywave',
  );

  try {
    final connection = await MySqlConnection.connect(settings);
    return connection;
  } catch (e) {
    print('Error de conexión a la base de datos: $e');
    throw 'No se pudo establecer la conexión a la base de datos.';
  }
}
