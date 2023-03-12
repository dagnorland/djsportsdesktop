// ignore_for_file: depend_on_referenced_packages

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'playlist.g.dart';

const String playlistBoxName = "playlist";
const String playlistTracksBoxName = "playlisttracks";
const String musicCenterBoxName = "musiccenterbox";

@JsonSerializable()
class StringList {
  List<String> items = [];
  StringList(this.items);

  factory StringList.fromJson(Map<String, dynamic> json) =>
      _$StringListFromJson(json);

  Map<String, dynamic> toJson() => _$StringListToJson(this);
}

@HiveType(typeId: 0)
@JsonSerializable()
class Playlist extends HiveObject {
  Playlist(
      {required this.id,
      required this.name,
      required this.type,
      required this.spotifyUri,
      required this.autoNext,
      required this.shuffleAtEnd,
      this.currentTrack = 0,
      this.playCount = 0,
      required this.trackIds,
      this.color = 4294967295,
      this.onlyMp3 = false});

  int get getDefaultColor => Colors.white.value;

  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String type;
  @HiveField(3)
  String spotifyUri;
  @HiveField(4)
  bool autoNext;
  @HiveField(5)
  bool shuffleAtEnd;
  @HiveField(6)
  int currentTrack;
  @HiveField(7)
  int playCount;
  @HiveField(8)
  List<String> trackIds;
  @HiveField(9)
  int? color;
  @HiveField(10)
  bool? onlyMp3;

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistToJson(this);

  void setCurrentTrack(String trackId) {
    debugPrint(
        'setCurrentTrack $trackId in plalist $name - we have ${trackIds.length.toString()} tracks');
    currentTrack = trackIds.indexOf(trackId);
  }

  Color randomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }
}

/*

final djPlaylist = await Hive.box<PlaylistWithTracks>(‘dj_playlists_with_tracks’).get(KEY_OF_PLAYLIST);
  final track1 = Track(‘…’);
  final track2 = Track(‘…’);
  final track3 = Track(‘…’);
 djPlaylist.tracks = HiveList([track1, track2, track3])

*/