import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/constants/colors_constants.dart';
import '../../../../../core/widgets/failure_widget.dart';
import '../../../../../core/widgets/load_widget.dart';
import '../../../../../core/widgets/primary_elevated_button_widget.dart';
import '../../../../../core/widgets/toast_widget.dart';

import '../../../domain/entities/user_entity.dart';

import '../../stores/get_random_user/get_random_user_state.dart';
import '../../stores/get_random_user/get_random_user_store.dart';
import '../../stores/save_user/save_user_state.dart';
import '../../stores/save_user/save_user_store.dart';

import 'components/content_component.dart';

class ProfilePage extends StatefulWidget {
  final UserEntity? localUser;

  const ProfilePage({Key? key, required this.localUser}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _getRandomUserStore = Modular.get<GetRandomUserStore>();
  final _saveUserStore = Modular.get<SaveUserStore>();

  final List<ReactionDisposer> _disposers = [];

  bool favorite = false;

  @override
  void initState() {
    super.initState();

    _getRandomUserStore.getRandom();

    /// Reações
    _disposers.add(
      reaction(
        (_) => _getRandomUserStore.state,
        _getRandomState,
      ),
    );

    _disposers.add(
      reaction(
        (_) => _saveUserStore.state,
        _saveState,
      ),
    );
  }

  @override
  void dispose() {
    for (var disposer in _disposers) {
      disposer();
    }
    super.dispose();
  }

  void _getRandomState(_) {
    final state = _getRandomUserStore.state;

    if (state is LoadingGetRandomUserState) {
      setState(() {
        favorite = false;
      });
    }
  }

  void _saveState(_) {
    final state = _saveUserStore.state;

    if (state is SuccessSaveUserState) {
      showToastWidget(context: context, message: 'Perfil salvo');

      setState(() {
        favorite = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.localUser != null ? 'Perfil salvo' : 'Perfil aleatório',
        ),
        actions: widget.localUser != null
            ? []
            : [
                Observer(
                  builder: (context) {
                    final getState = _getRandomUserStore.state;
                    final saveState = _saveUserStore.state;

                    return IconButton(
                      disabledColor: ColorsConstants.divider,
                      onPressed: getState is SuccessGetRandomUserState &&
                              saveState is! LoadingSaveUserState
                          ? () {
                              _saveUserStore.save(user: getState.user);
                            }
                          : null,
                      icon: Icon(
                        favorite ? Icons.favorite : Icons.favorite_border,
                      ),
                    );
                  },
                ),
                IconButton(
                  onPressed: () {
                    _getRandomUserStore.getRandom();
                  },
                  icon: const Icon(Icons.refresh),
                ),
              ],
      ),
      floatingActionButton: widget.localUser != null
          ? Container()
          : PrimaryElevatedButtonWidget(
              text: 'Perfis salvos',
              onPressed: () {
                Modular.to.pushNamed('./list');
              },
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: widget.localUser != null
          ? ContentComponent(user: widget.localUser!)
          : Observer(
              builder: (context) {
                final state = _getRandomUserStore.state;

                if (state is LoadingGetRandomUserState) {
                  return const LoadWidget();
                } else if (state is FailureGetRandomUserState) {
                  return FailureWidget(
                    message: state.error,
                    onPressed: _getRandomUserStore.getRandom,
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
