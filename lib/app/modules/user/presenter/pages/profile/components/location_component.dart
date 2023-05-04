import 'package:flutter/material.dart';

import '../../../../../../core/constants/colors_constants.dart';

import '../../../../domain/entities/user_entity.dart';

class LocationComponent extends StatelessWidget {
  final UserEntity user;

  const LocationComponent({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      decoration: BoxDecoration(
        color: ColorsConstants.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on,
                color: ColorsConstants.primary,
                size: 22,
              ),
              const SizedBox(width: 8),
              Text(
                'Endereço',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '${user.location.streetName}, ${user.location.streetNumber}',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            '${user.location.city} - ${user.location.state} - ${user.location.country}',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            user.location.postcode,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
