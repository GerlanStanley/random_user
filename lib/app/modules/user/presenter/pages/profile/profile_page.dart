import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/widgets/failure_widget.dart';
import '../../../../../core/widgets/load_widget.dart';

import '../../stores/get_random_user/get_random_user_state.dart';
import '../../stores/get_random_user/get_random_user_store.dart';

import 'components/content_component.dart';

class ProfilePage extends StatefulWidget {
  final String? localUserId;

  const ProfilePage({Key? key, required this.localUserId}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _getRandomUserStore = Modular.get<GetRandomUserStore>();

  @override
  void initState() {
    super.initState();

    _getRandomUserStore.getRandom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Observer(
        builder: (context) {
          final state = _getRandomUserStore.state;

          if (state is LoadingGetRandomUserState) {
            return const LoadWidget();
          } else if (state is FailureGetRandomUserState) {
            return FailureWidget(
              message: state.error,
              onPressed: () => _getRandomUserStore.getRandom(),
            );
          } else if (state is SuccessGetRandomUserState) {
            return ContentComponent(user: state.user);
          }

          return Container();
        },
      ),
    );
  }
}
