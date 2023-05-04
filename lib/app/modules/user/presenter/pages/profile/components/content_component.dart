import 'package:flutter/material.dart';

import '../../../../domain/entities/user_entity.dart';

import 'contact_component.dart';
import 'header_component.dart';
import 'location_component.dart';
import 'sub_header_component.dart';

class ContentComponent extends StatelessWidget {
  final UserEntity user;

  const ContentComponent({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeaderComponent(user: user),
          SubHeaderComponent(user: user),
          ContactComponent(user: user),
          LocationComponent(user: user),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
