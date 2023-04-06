import 'package:band_names_sockets_application/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // usando el provider desde la instancia de SocketService socketService
    // para actualizar la UI
    final socketService = Provider.of<SocketService>(context);

    // usando la instancia de SockeService socketService para emitir un evento
    // hacia el servidor

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Server Status: ${socketService.serverStatus}')],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.send_sharp),
        onPressed: () {
          // emitiendo un evento
          socketService.socket.emit(
            'nuevo-evento-from-ios',
            {'name': 'flutter', 'message': 'message sending from ios'},
          );
        },
      ),
    );
  }
}
