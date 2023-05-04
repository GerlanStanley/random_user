import 'package:flutter/material.dart';

import '../../../../domain/entities/user_entity.dart';

import '../../../stores/delete_user/delete_user_store.dart';

import 'user_list_tile_component.dart';

class ListViewComponent extends StatelessWidget {
  final List<UserEntity> users;
  final DeleteUserStore deleteUserStore;

  const ListViewComponent({
    Key? key,
    required this.users,
    required this.deleteUserStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return UserListTileComponent(
          user: users[index],
          deleteUserStore: deleteUserStore,
        );
      },
    );
  }
}
