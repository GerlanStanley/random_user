import 'package:flutter/material.dart';

import '../../../../../../core/widgets/cached_network_image_widget.dart';

import '../../../../domain/entities/user_entity.dart';

class ContentComponent extends StatelessWidget {
  final UserEntity user;

  const ContentComponent({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImageWidget(
          image: user.picture.large,
          fit: BoxFit.cover,
        ),
        Text(user.name.fullName),
        Text(user.email),
      ],
    );
  }
}
