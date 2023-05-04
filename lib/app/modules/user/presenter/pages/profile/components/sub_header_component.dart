import 'package:flutter/material.dart';

import '../../../../../../core/constants/colors_constants.dart';

import '../../../../domain/entities/user_entity.dart';

class SubHeaderComponent extends StatelessWidget {
  final UserEntity user;

  const SubHeaderComponent({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      decoration: BoxDecoration(
        color: ColorsConstants.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildItem(
            context: context,
            title: 'Fuso horário',
            value: user.location.timezoneOffset,
          ),
          _buildItem(
            context: context,
            title: 'Idade',
            value: user.age.toString(),
          ),
          _buildItem(
            context: context,
            title: 'Nacionalidade',
            value: user.nationality,
          ),
        ],
      ),
    );
  }

  Widget _buildItem({
    required BuildContext context,
    required String title,
    required String value,
  }) {
    return Expanded(
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
