part of 'playlists_cubit.dart';

enum PlaylistsInitStatus { loading, loaded, error, emptyList }

class PlaylistsState extends Equatable {
  const PlaylistsState({
    this.initStatus = PlaylistsInitStatus.loading,
    this.playlists = const [],
  });

  final PlaylistsInitStatus initStatus;
  final List<Playlist> playlists;

  bool get weHaveSomePlaylists => playlists.isNotEmpty;

  PlaylistsState copyWith({
    PlaylistsInitStatus? initStatus,
    List<Playlist>? playlists,
  }) {
    return PlaylistsState(
      initStatus: initStatus ?? this.initStatus,
      playlists: playlists ?? this.playlists,
    );
  }

  @override
  List<Object> get props => [initStatus, playlists];
}
