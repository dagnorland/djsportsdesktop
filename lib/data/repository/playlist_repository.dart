import 'dart:collection';

import 'package:djsportsdesktop/core/enums.dart';
import 'package:djsportsdesktop/data/models/playlist/playlist.dart';
import 'package:djsportsdesktop/data/models/track/track.dart';
import 'package:djsportsdesktop/utils/paths.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

class PlaylistRepository {
  // add a constructor with playlistbox and trackbox
  PlaylistRepository();

  late final Box<Playlist> playlistBox;
  late final Box<List<Map<String, dynamic>>> playlistTracksBox;
  late final Box<Track> tracklistBox;

  // Repository playlists
  List<Playlist> playlists = [];
  Map<String, List<Track>> tracklist = HashMap();
  late Playlist activePlaylist;

  bool initiated = false;

  List<Playlist> addFirstPlaylist(String name) {
    if (!initiated) {
      throw Exception('PlaylistRepository not initiated');
    }

    Playlist playlist = Playlist(
        id: const Uuid().v4(),
        name: name,
        type: PlaylistType.score.name,
        spotifyUri: '',
        autoNext: true,
        shuffleAtEnd: true,
        trackIds: []);
    playlistBox.add(playlist);
    playlists.add(playlist);
    return playlists;
  }

  List<Playlist> getPlaylists() {
    if (!initiated) {
      throw Exception('PlaylistRepository not initiated');
    }

    return playlists;
  }

  Future<void> initiate() async {
    if (initiated) {
      return Future.value();
    }
    String? path = await Paths.getApplicationDocumentsPath();
    await Hive.initFlutter(path);
    Hive.registerAdapter(PlaylistAdapter());
    Hive.registerAdapter(TrackAdapter());

    try {
      tracklistBox = await Hive.openBox<Track>(trackBoxName);
      playlistTracksBox = await Hive.openBox(playlistTracksBoxName);
      playlistBox = await Hive.openBox<Playlist>(playlistBoxName);

      // We are testing writes...
      //tracklistBox.deleteAll(tracklistBox.keys);
      //playlistTracksBox.deleteAll(playlistTracksBox.keys);
      //playlistBox.deleteAll(playlistBox.keys);

      debugPrint('HIVE INIT - ==== START ======');

      if (playlistTracksBox.isEmpty) {
        debugPrint('HIVE INIT - empty playlistTracksBox');
      }
      if (tracklistBox.isEmpty) {
        debugPrint('HIVE INIT - empty tracklistBox');
      }
      //tracklistBox.clear();
    } catch (e) {
      debugPrint('DJHiveListController open $e');
      return Future.error(e);
    }

    debugPrint('HIVE INIT - ==== DONE ======');

    initiated = true;
    return Future.value();
  }

  Future<List<Playlist>> loadAllPlaylists() async {
    await initiate();

    debugPrint(
        'PlaylistRepository loadAllPlaylists - we have djplaylists: ${playlists.length} and djplaylisttracklist: ${tracklist.length}');

    tracklist = HashMap();
    try {
      playlists = playlistBox.values.toList();
      for (var playlist in playlists) {
        debugPrint(
            'loadAllPlaylists - playlist: ${playlist.id} - ${playlist.name} tracks: ${playlist.trackIds.length}');
      }

      for (var playlist in playlists) {
        debugPrint('loadAllPlaylists - djplaylist: ${playlist.name}');
        for (var trackId in playlist.trackIds) {
          Track? newTrack = tracklistBox.get(trackId);
          if (newTrack != null) {
            if (tracklist.containsKey(playlist.id)) {
              tracklist[playlist.id]!.add(newTrack);
            } else {
              tracklist[playlist.id] = [newTrack];
            }
          } else {
            debugPrint(
                'loadAllPlaylists - trackId: $trackId not found in box on playlist: ${playlist.name}');
          }
        }
      }
      debugPrint(
          'DJPlaylistController loadAllPlaylists - AFTER RELOAD we have djplaylists: ${playlists.length} and djplaylisttracklist: ${tracklist.length}');

      if (playlists.isNotEmpty) {
        activePlaylist = playlists.first;
      }
    } catch (e) {
      debugPrint('DJPlaylistController loadAllPlaylists $e');
      return Future.error(e);
    }
    return playlists;
  }
}
