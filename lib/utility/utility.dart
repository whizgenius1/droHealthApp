import 'export_packages.dart';
import 'export_database.dart';
import 'export_utilities.dart';

SharedPrefUtils sharedPrefUtils = SharedPrefUtils();
UserDataBase userDatabase = UserDataBase.instance;
ConnectionStatus connectionStatus = ConnectionStatus.getInstance();

// Future<Database> getDatabase() async {
//   Database database = await userDatabase.database;
//   return database;
// }

String _databaseVersion = dotenv.env['DATABASE_VERSION'] ?? '0';
int get databaseVersion => int.parse(_databaseVersion);

String _databaseName = dotenv.env['DATABASE_NAME'] ?? '';
String get databaseName => _databaseName;

///get an instance of the database we created
Future<Database> getDatabase() async => await userDatabase.database;

///TO display the Naira sign
Runes _input = Runes('\u20a6');
String _symbol = String.fromCharCodes(_input);
Runes get input => _input;
String get symbol => _symbol;
