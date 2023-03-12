import 'package:djsportsdesktop/l10n.dart';
import 'package:flutter/material.dart';

enum PlaylistsError { cantCreatePlaylist, cantDeletePlaylist }

extension PlaylistsErrorX on PlaylistsError? {
  String message(BuildContext context) {
    switch (this) {
      case PlaylistsError.cantCreatePlaylist:
        return 'Ordren kan ikke parkeres fordi betaling er påstartet.';
      case PlaylistsError.cantDeletePlaylist:
        return 'Ordren kan ikke slettes fordi betaling er påstartet.';
      default:
        return $t(context).somethingWentWrong;
    }
  }
}
