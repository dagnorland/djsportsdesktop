import 'package:djsportsdesktop/pages/playlists/cubit/playlists_cubit.dart';
import 'package:djsportsdesktop/pages/playlists/focus.dart';
import 'package:djsportsdesktop/pages/playlists/widgets/playlist_init_failure_modal.widget.dart';
import 'package:djsportsdesktop/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import 'package:djsportsdesktop/l10n.dart';
import 'package:djsportsdesktop/pages/playlists/error.dart';

class PlaylistsPage extends StatelessWidget {
  const PlaylistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<PlaylistsFocus>(
      create: (_) => PlaylistsFocus(),
      dispose: (_, orderFocus) => orderFocus.dispose(),
      child: const PLaylistsView(),
    );
  }
}

class PLaylistsView extends StatelessWidget {
  const PLaylistsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlaylistsCubit, PlaylistsState>(
      listenWhen: (prev, next) => prev.initStatus != next.initStatus,
      listener: (context, state) {
        if (state.initStatus == PlaylistsInitStatus.emptyList) {
          PlaylistEmptyMessageModalWidget.show(context);
        }
      },
      child: const PlaylistsView(),
    );
  }
}

class PlaylistsView extends StatefulWidget {
  const PlaylistsView({super.key});

  @override
  State<PlaylistsView> createState() => PlaylistsViewState();
}

class PlaylistsViewState extends State<PlaylistsView> {
  late final PlaylistsFocus _focus;
  late final Map<Type, Action<Intent>> _actions;

  @override
  void didChangeDependencies() {
    final playlistsState = context.read<PlaylistsCubit>().state;

    if (playlistsState.playlists.isEmpty) {
      _focus.focusOrderItemsSearch();
    } else {
      _focus.focusCustomerSearch();
    }

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();

    // Init focus and focus on customer search on init
    _focus = context.read()..focusCustomerSearch();

    _actions = {
      PlaylistRefreshIntent: CallbackAction(
        onInvoke: (_) {
          final canRefresh =
              context.read<PlaylistsCubit>().state.weHaveSomePlaylists;

          if (canRefresh) {
            context.read<PlaylistsCubit>().onRefresh();
          }

          return;
        },
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PlaylistsCubit, PlaylistsState>(
          listenWhen: (prev, next) => prev.initStatus != next.initStatus,
          listener: (context, state) {
            if (state.initStatus == PlaylistsInitStatus.emptyList) {
              PlaylistEmptyMessageModalWidget.show(context);
            }
          },
        )
      ],
      child: const Text('What happened ? '),
    );
  }
}
