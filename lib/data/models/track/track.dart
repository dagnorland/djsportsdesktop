import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'track.g.dart';

const String trackBoxName = "track";

@HiveType(typeId: 1)
@JsonSerializable()
class Track extends HiveObject {
  Track(
      {required this.id,
      required this.name,
      required this.album,
      required this.artist,
      required this.startTime,
      required this.startTimeMS,
      required this.duration,
      required this.playCount,
      required this.spotifyUri,
      required this.mp3Path});

  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String album;
  @HiveField(3)
  String artist;
  @HiveField(4)
  int startTime;
  @HiveField(5)
  int startTimeMS;
  @HiveField(6)
  int duration;
  @HiveField(7)
  int playCount;
  @HiveField(8)
  String spotifyUri;
  @HiveField(9)
  String mp3Path;

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  factory Track.empty() => Track(
      id: const Uuid().v4().toString(),
      name: "empty",
      album: "empty",
      artist: "",
      startTime: 0,
      startTimeMS: 0,
      duration: 0,
      playCount: 0,
      spotifyUri: '',
      mp3Path: '');

  Map<String, dynamic> toJson() => _$TrackToJson(this);

  @override
  String toString() {
    return 'DJTRACK: $name: $name by $artist from $album';
  }

  String getStartTimeFormatted() {
    int tempStartTime = startTime;

    int minutes = tempStartTime ~/ 60;
    int remainSec = (tempStartTime % 60);
    return ('${minutes.toString().padLeft(2, '0')}:${remainSec.toString().padLeft(2, '0')}');
  }

  String getDurationFormatted() {
    int tempDuration = duration;

    int minutes = tempDuration ~/ 60;
    int remainSec = (tempDuration % 60);
    return ('${minutes.toString().padLeft(2, '0')}:${remainSec.toString().padLeft(2, '0')}');
  }
}
