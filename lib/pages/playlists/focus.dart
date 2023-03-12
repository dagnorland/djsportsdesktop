import 'dart:developer';

import 'package:flutter/material.dart';

class PlaylistsFocus {
  final FocusScopeNode _playlist =
      FocusScopeNode(debugLabel: 'selected_playlist');
  final FocusNode _playlistSearch = FocusNode(debugLabel: 'playlist_search');
  final FocusNode _playlistItemsSearch =
      FocusNode(debugLabel: 'playlists_items_search');

  FocusScopeNode get playlistFocus => _playlist;
  FocusNode get playlistSearchFocus => _playlistSearch;
  FocusNode get playlistItemsSearchFocus => _playlistItemsSearch;

  FocusNode? scheduledFocus;

  void scheduleRefocusingOfOrderItemsSearch() {
    unfocusAndAddPostBuildFocus(playlistItemsSearchFocus);
  }

  void unfocusAndAddPostBuildFocus(FocusNode focusNode) {
    focusNode.unfocus();
    scheduledFocus = focusNode;
  }

  void maybeFocusScheduledFocus() {
    if (scheduledFocus != null) {
      scheduledFocus!.requestFocus();
      scheduledFocus = null;
    }
  }

  /// To make sure that the focus is set after all widgets are built
  void delayedCallback(VoidCallback callback) {
    Future.delayed(const Duration(milliseconds: 50), callback);
  }

  void focusCustomer() {
    log('_customer.requestFocus() called');
    delayedCallback(_playlist.requestFocus);
  }

  void focusCustomerSearch() {
    log('_customerSearch.requestFocus() called');
    delayedCallback(_playlistSearch.requestFocus);
  }

  void focusOrderItemsSearch() {
    log('_orderItemsSearch.requestFocus() called');
    delayedCallback(_playlistItemsSearch.requestFocus);
  }

  void dispose() {
    _playlist.dispose();
    _playlistSearch.dispose();
    _playlistItemsSearch.dispose();
  }
}
