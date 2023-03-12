import 'package:djsportsdesktop/pages/main/enums.dart';
import 'package:djsportsdesktop/pages/main/widgets/main_page_app_bar.widget.dart';
import 'package:djsportsdesktop/pages/main/widgets/main_page_nav_bar.widget.dart';
import 'package:djsportsdesktop/pages/playlists/cubit/playlists_cubit.dart';
import 'package:djsportsdesktop/pages/playlists/playlists_page.dart';
import 'package:djsportsdesktop/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _mainViews = [
  PlaylistsPage(),
  SizedBox.shrink(),
  SizedBox.shrink(),
  SizedBox.shrink(),
  SizedBox.shrink(),
  SizedBox.shrink(),
  SizedBox.shrink(),
  SizedBox.shrink(),
];

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlaylistsCubit(
        playlistRepository: context.read(),
      ),
      child: const MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late final FocusNode _mainFocusNode;
  var _currentPage = MainPageENUM.playlists;

  void _onNavigateToPage(MainPageENUM page) {
    if (page != _currentPage) {
      setState(() => _currentPage = page);
    }
  }

  @override
  void initState() {
    super.initState();
    _mainFocusNode = FocusNode(debugLabel: 'main_page_focus_node');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Always make sure that the main focus node is always focused to prevent OS from stealing focus from the app.
      onTap: _mainFocusNode.requestFocus,
      child: Shortcuts.manager(
        manager: GlobalShortcutManager(),
        child: Actions(
          actions: {
            PageNavigationIntent: CallbackAction<PageNavigationIntent>(
              onInvoke: (intent) => _onNavigateToPage(intent.toPage),
            ),
          },
          child: Focus(
            debugLabel: 'main_page_focus_widget',
            focusNode: _mainFocusNode,
            child: Scaffold(
              body: Column(
                children: [
                  const MainPageAppBar(),
                  Expanded(child: _mainViews[_currentPage.index]),
                  MainPageNavBarWidget(
                    currentPage: _currentPage,
                    onNavItemSelected: _onNavigateToPage,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
