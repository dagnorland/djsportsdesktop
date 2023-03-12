import 'package:djsportsdesktop/core/core.dart';
import 'package:djsportsdesktop/core/extensions.dart';
import 'package:djsportsdesktop/data/repository/playlist_repository.dart';
import 'package:djsportsdesktop/pages/playlists/cubit/playlists_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PlaylistModalWidget extends StatelessWidget {
  const PlaylistModalWidget({
    required this.title,
    required this.description,
    required this.icon,
    this.actions = const [],
    super.key,
  });

  final String title;
  final String description;
  final Icon icon;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Container(
        width: AppSizes.modalDefaultMinWidth,
        decoration: BoxDecoration(color: context.colorTheme().surface),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSizes.bodyInsetHorizontal),
              child: Column(
                children: [
                  Text(
                    title,
                    style: context
                        .textTheme()
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const Gap(AppSizes.smallGap),
                  Row(
                    children: [
                      icon,
                      const Gap(AppSizes.smallGap),
                      Flexible(
                        child: Text(description,
                            style: context.textTheme().bodyLarge),
                      ),
                    ],
                  ),
                  const Gap(AppSizes.smallGap),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(AppSizes.smallGap),
              decoration: BoxDecoration(
                color: context.colorTheme().background,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlaylistEmptyMessageModalWidget extends StatelessWidget {
  const PlaylistEmptyMessageModalWidget({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Dialog(child: PlaylistEmptyMessageModalWidget()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlaylistModalWidget(
      title: 'Velkommen til DJSportsDesktop',
      description: 'Det er ingen spillelister lagt inn.',
      icon: Icon(Icons.playlist_add_rounded,
          size: 36, color: context.colorTheme().info),
      actions: [
        TextButton.icon(
          label: const Text('Lag din første spilleliste'),
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pop();
            context
                .read<PlaylistsCubit>()
                .onAddFirstPlaylist(name: 'First playlist');
          },
        ),
      ],
    );
  }
}
