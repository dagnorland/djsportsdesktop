import 'package:djsportsdesktop/core/core.dart';
import 'package:djsportsdesktop/core/ui/global_loading_overlay.widget.dart';
import 'package:djsportsdesktop/data/local_storage.dart';
import 'package:djsportsdesktop/data/repository/playlist_repository.dart';
import 'package:djsportsdesktop/pages/main/main_page.dart';
import 'package:djsportsdesktop/pages/playlists/cubit/playlists_cubit.dart';
//import 'package:djsportsdesktop/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalStorage.instance.init();
  final PlaylistRepository playlistRepository = PlaylistRepository();

  runApp(
    DJSportsDesktopApp(
      playlistRepository: playlistRepository,
    ),
  );
}

class DJSportsDesktopApp extends StatelessWidget {
  const DJSportsDesktopApp({
    Key? key,
    required this.playlistRepository,
  }) : super(key: key);

  final PlaylistRepository playlistRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<PlaylistRepository>(
              create: (_) => playlistRepository),
        ],
        child: BlocProvider<PlaylistsCubit>(
          create: (context) => PlaylistsCubit(
            playlistRepository: context.read(),
          ),
          child: const DJSportsDesktopAppView(),
        ));
  }
}

class DJSportsDesktopAppView extends StatelessWidget {
  const DJSportsDesktopAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      builder: (context, theme) {
        return GlobalLoadingOverlayWidget(
          child: MaterialApp(
            title: 'DJ Sports Desktop',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: const Locale('no'),
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: const MainPage(),
          ),
        );
      },
    );
  }
}
