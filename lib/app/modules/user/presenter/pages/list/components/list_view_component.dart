import 'package:flutter/material.dart';

import '../../../../domain/entities/user_entity.dart';

import 'user_list_tile_component.dart';

class ListViewComponent extends StatelessWidget {
  final List<UserEntity> users;

  const ListViewComponent({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return UserListTileComponent(user: users[index]);
      },
    );
  }
}
