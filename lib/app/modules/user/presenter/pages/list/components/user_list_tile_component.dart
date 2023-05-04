import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../../core/constants/colors_constants.dart';
import '../../../../../../core/widgets/cached_network_image_widget.dart';

import '../../../../domain/entities/user_entity.dart';

import '../../../stores/delete_user/delete_user_store.dart';

class UserListTileComponent extends StatelessWidget {
  final UserEntity user;
  final DeleteUserStore deleteUserStore;

  const UserListTileComponent({
    Key? key,
    required this.user,
    required this.deleteUserStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              deleteUserStore.delete(user: user);
            },
            backgroundColor: ColorsConstants.delete,
            foregroundColor: Colors.white,
            icon: Icons.close,
            label: 'Excluir',
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Modular.to.pushNamed('./', arguments: user);
        },
        child: Row(
          children: [
            CachedNetworkImageWidget(image: user.picture.medium),
            Column(
              children: [
                Text(user.name.fullName),
                Text(user.email),
              ],
            )
          ],
        ),
      ),
    );
  }
}
