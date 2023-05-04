import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/widgets/failure_widget.dart';
import '../../../../../core/widgets/load_widget.dart';

import '../../../../../core/widgets/toast_widget.dart';
import '../../stores/delete_user/delete_user_state.dart';
import '../../stores/delete_user/delete_user_store.dart';
import '../../stores/get_all_users_saved/get_all_users_saved_state.dart';
import '../../stores/get_all_users_saved/get_all_users_saved_store.dart';

import 'components/list_view_component.dart';

class ListUsersPage extends StatefulWidget {
  const ListUsersPage({Key? key}) : super(key: key);

  @override
  State<ListUsersPage> createState() => _ListUsersPageState();
}

class _ListUsersPageState extends State<ListUsersPage> {
  final _getAllUsersSavedStore = Modular.get<GetAllUsersSavedStore>();
  final _deleteUserStore = Modular.get<DeleteUserStore>();

  final List<ReactionDisposer> _disposers = [];

  @override
  void initState() {
    super.initState();

    _getAllUsersSavedStore.getAll();

    /// Reações
    _disposers.add(
      reaction(
            (_) => _deleteUserStore.state,
        _deleteState,
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

  void _deleteState(_) {
    final state = _deleteUserStore.state;

    if (state is SuccessDeleteUserState) {
      showToastWidget(context: context, message: 'Perfil removido');
      _getAllUsersSavedStore.getAll();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Observer(
        builder: (context) {
          final state = _getAllUsersSavedStore.state;

          if (state is LoadingGetAllUsersSavedState) {
            return const LoadWidget();
          } else if (state is FailureGetAllUsersSavedState) {
            return FailureWidget(
              message: state.error,
              onPressed: _getAllUsersSavedStore.getAll,
            );
          } else if (state is SuccessGetAllUsersSavedState) {
            return ListViewComponent(
              users: state.users,
              deleteUserStore: _deleteUserStore,
            );
          }

          return Container();
        },
      ),
    );
  }
}
