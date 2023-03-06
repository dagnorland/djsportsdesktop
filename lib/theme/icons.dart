import 'package:djsportsdesktop/theme/colors.dart';
import 'package:flutter/material.dart';

Image imageDJLogo() {
  return Image.asset(
    'assets/images/djsportshallicon.png',
  );
}

Widget iconsOnboarding(bool active) {
  return Image.asset(
    'assets/icons/onboarding.png',
    height: 20,
    color: active ? DJColors.primary : DJColors.onSurfaceLow,
  );
}

Widget iconsMusicLibrary(bool active) {
  return Icon(Icons.queue_music,
      color: active ? DJColors.primary : DJColors.onSurfaceLow,
      size: 24.0,
      semanticLabel: 'Match Center label');
}

Widget iconsControlCenter(bool active) {
  return Icon(
    Icons.sports_handball_outlined,
    color: active ? DJColors.primary : DJColors.onSurfaceLow,
    size: 24.0,
    semanticLabel: 'Match Center label',
  );
}

Widget iconsSpotifySearch(bool active) {
  return Icon(
    Icons.search,
    color: active ? DJColors.primary : DJColors.onSurfaceLow,
    size: 24.0,
    semanticLabel: 'Spotify Search Label',
  );
}

Widget iconsPlaylist(bool active) {
  return Icon(
    Icons.featured_play_list_outlined,
    color: active ? DJColors.primary : DJColors.onSurfaceLow,
    size: 24.0,
    semanticLabel: 'Playlist with tracks',
  );
}
