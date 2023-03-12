// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlaylistAdapter extends TypeAdapter<Playlist> {
  @override
  final int typeId = 0;

  @override
  Playlist read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Playlist(
      id: fields[0] as String,
      name: fields[1] as String,
      type: fields[2] as String,
      spotifyUri: fields[3] as String,
      autoNext: fields[4] as bool,
      shuffleAtEnd: fields[5] as bool,
      currentTrack: fields[6] as int,
      playCount: fields[7] as int,
      trackIds: (fields[8] as List).cast<String>(),
      color: fields[9] as int?,
      onlyMp3: fields[10] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Playlist obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.spotifyUri)
      ..writeByte(4)
      ..write(obj.autoNext)
      ..writeByte(5)
      ..write(obj.shuffleAtEnd)
      ..writeByte(6)
      ..write(obj.currentTrack)
      ..writeByte(7)
      ..write(obj.playCount)
      ..writeByte(8)
      ..write(obj.trackIds)
      ..writeByte(9)
      ..write(obj.color)
      ..writeByte(10)
      ..write(obj.onlyMp3);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaylistAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StringList _$StringListFromJson(Map<String, dynamic> json) => StringList(
      (json['items'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$StringListToJson(StringList instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

Playlist _$PlaylistFromJson(Map<String, dynamic> json) => Playlist(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      spotifyUri: json['spotifyUri'] as String,
      autoNext: json['autoNext'] as bool,
      shuffleAtEnd: json['shuffleAtEnd'] as bool,
      currentTrack: json['currentTrack'] as int? ?? 0,
      playCount: json['playCount'] as int? ?? 0,
      trackIds:
          (json['trackIds'] as List<dynamic>).map((e) => e as String).toList(),
      color: json['color'] as int? ?? 4294967295,
      onlyMp3: json['onlyMp3'] as bool? ?? false,
    );

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'spotifyUri': instance.spotifyUri,
      'autoNext': instance.autoNext,
      'shuffleAtEnd': instance.shuffleAtEnd,
      'currentTrack': instance.currentTrack,
      'playCount': instance.playCount,
      'trackIds': instance.trackIds,
      'color': instance.color,
      'onlyMp3': instance.onlyMp3,
    };
