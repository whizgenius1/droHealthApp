import 'package:dro_app/utility/export_packages.dart';

class SharedPrefUtils {
  static SharedPreferences? _sharedPrefs;

  factory SharedPrefUtils() => SharedPrefUtils._internal();

  SharedPrefUtils._internal();

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  setString({required String key, required String value}) {
    init();
    _sharedPrefs!.setString(key, value);
  }

  String getString({required String key}) {
    init();
    return _sharedPrefs!.getString(key) ?? '';
  }

  // final String _vendorId = 'vendorId';
  // final String _userId = 'userId';
  // final String _authToken = 'authToken';
  // final String _userName = 'userName';
  // final String _userEmail = 'userEmail';
  // final String _userPhone = 'userPhone';
  //
  // String get vendorId => _vendorId;
  // String get userId => _userId;
  // String get authToken => _authToken;
  //
  // String get userName => _userName;
  // String get userEmail => _userEmail;
  // String get userPhone => _userPhone;
}

final String _databasePath = 'databasePath';
String get dbPath => _databasePath;
