import 'package:flutter/material.dart';

import '../../../../../../core/widgets/cached_network_image_widget.dart';

import '../../../../domain/entities/user_entity.dart';

class UserListTileComponent extends StatelessWidget {
  final UserEntity user;

  const UserListTileComponent({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
