import 'package:bloc/bloc.dart';
import 'package:djsportsdesktop/data/models/playlist/playlist.dart';
import 'package:djsportsdesktop/data/repository/playlist_repository.dart';
import 'package:equatable/equatable.dart';

part 'playlists_state.dart';

class PlaylistsCubit extends Cubit<PlaylistsState> {
  PlaylistsCubit({
    required this.playlistRepository,
  }) : super(const PlaylistsState()) {
    onInit();
  }

  final PlaylistRepository playlistRepository;

  Future<void> onAddFirstPlaylist({required String name}) async {
    emit(state.copyWith(initStatus: PlaylistsInitStatus.loading));

    try {
      List<Playlist> playlists = playlistRepository.addFirstPlaylist(name);
      emit(state.copyWith(
        playlists: playlists,
        initStatus: playlists.isEmpty
            ? PlaylistsInitStatus.emptyList
            : PlaylistsInitStatus.loaded,
      ));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> onLoadPlaylists() async {
    emit(state.copyWith(initStatus: PlaylistsInitStatus.loading));

    try {
      playlistRepository.loadAllPlaylists().then((playlists) {
        emit(state.copyWith(
          playlists: playlists,
          initStatus: playlists.isEmpty
              ? PlaylistsInitStatus.emptyList
              : PlaylistsInitStatus.loaded,
        ));
      });
    } catch (e) {
      emit(state.copyWith(initStatus: PlaylistsInitStatus.error));
    }
  }

  Future<void> onRefresh() async {
    emit(state.copyWith(initStatus: PlaylistsInitStatus.loading));

    try {
      onLoadPlaylists();
    } catch (e) {
      emit(state.copyWith(initStatus: PlaylistsInitStatus.error));
    }
  }

  Future<void> onInit() async {
    emit(state.copyWith(
      playlists: [],
      initStatus: PlaylistsInitStatus.loading,
    ));

    try {
      onLoadPlaylists();
    } catch (e) {
      emit(state.copyWith(initStatus: PlaylistsInitStatus.error));
    }
  }
}
