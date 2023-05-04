import 'package:flutter/material.dart';

import '../../../../../../core/constants/colors_constants.dart';
import '../../../../../../core/widgets/cached_network_image_widget.dart';

import '../../../../domain/entities/user_entity.dart';

class HeaderComponent extends StatelessWidget {
  final UserEntity user;

  const HeaderComponent({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(20, 60, 20, 20),
            padding: const EdgeInsets.fromLTRB(20, 90, 20, 20),
            decoration: BoxDecoration(
              color: ColorsConstants.card,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  user.name.fullName,
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  user.email,
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user.gender,
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      width: 4,
                      height: 4,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).textTheme.titleSmall!.color,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Text(
                      user.username,
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: CachedNetworkImageWidget(
              image: user.picture.large,
              fit: BoxFit.cover,
              width: 120,
              height: 120,
              borderRadius: BorderRadius.circular(120),
              border: Border.all(
                color: Colors.white,
                width: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
