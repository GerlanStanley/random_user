import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String? localUserId;

  const ProfilePage({Key? key, required this.localUserId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuário aleatório - $localUserId'),
      ),
    );
  }
}
