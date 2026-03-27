import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/user_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    final userService = UserService();

    final user = auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await auth.logout();
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              var data = await userService.getUser(user!.uid);
              print(data?.email);
            },
            child: const Text("Leer usuario"),
          ),
          ElevatedButton(
            onPressed: () async {
              await userService.updateEmail(
                user!.uid,
                "nuevo@email.com",
              );
            },
            child: const Text("Actualizar email"),
          ),
          ElevatedButton(
            onPressed: () async {
              await userService.deleteUser(user!.uid);
            },
            child: const Text("Eliminar usuario"),
          ),
        ],
      ),
    );
  }
}