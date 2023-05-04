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
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Slidable(
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
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(30, 30, 0, 0),
                padding: const EdgeInsets.fromLTRB(70, 20, 20, 20),
                decoration: BoxDecoration(
                  color: ColorsConstants.card,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      user.name.fullName,
                      style: Theme.of(context).textTheme.displaySmall
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user.email,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              CachedNetworkImageWidget(
                image: user.picture.medium,
                fit: BoxFit.cover,
                width: 70,
                height: 70,
                borderRadius: BorderRadius.circular(120),
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
