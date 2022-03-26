import 'dart:async';
import 'dart:io';

///class to check internet connection by pinging google server
class ConnectionStatus {
  static final ConnectionStatus _singleton = ConnectionStatus._internal();
  ConnectionStatus._internal();

  static ConnectionStatus getInstance() => _singleton;

  bool hasConnection = false;

  StreamController connectionChangeController =
      new StreamController.broadcast();

  Stream get connectionChange => connectionChangeController.stream;

  void dispose() {
    connectionChangeController.close();
  }

  void initialize() {
    checkConnection();
  }

  //The test to actually see if there is a connection
  Future<bool> checkConnection() async {
    bool previousConnection = hasConnection;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (_) {
      hasConnection = false;
    }

    //The connection status changed send out an update to all listeners
    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }

    return hasConnection;
  }
}
