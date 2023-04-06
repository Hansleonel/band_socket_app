import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus {
  Online,
  Offline,
  Connecting,
}

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket _socket = IO.io('uri');

  SocketService() {
    this._initConfig();
  }

  ServerStatus get serverStatus => _serverStatus;

  IO.Socket get socket => _socket;

  void _initConfig() {
    _socket = IO.io('http://localhost:3001/', {
      'transports': ['websocket'],
      'autoConnect': true,
    });
    _socket.onConnect((_) {
      print('connect');
      // socket.emit('msg', 'test');
      _serverStatus = ServerStatus.Online;
      notifyListeners();
    });
    // socket.on('event', (data) => print(data));
    _socket.onDisconnect((_) {
      print('disconnect');
      _serverStatus = ServerStatus.Offline;
      notifyListeners();
    });
    // socket.on('fromServer', (_) => print(_));

    // socket.on('new-message-event', (payload) {
    //   print(payload);
    //   print('nombre: ${payload['name']}');
    //   print('meesage: ${payload['message']}');
    //   print('seniority: ${payload['seniority'] ?? 'sSr'}');
    // });

    // emitir un evento desde un cliente al servidor
  }
}
