import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:djsportsdesktop/pages/main/enums.dart';

String shortcutActivatorLabel(LogicalKeyboardKey key) {
  if (Platform.isMacOS) {
    return 'CMD+${key.keyLabel.toUpperCase()}';
  } else {
    return 'ALT+${key.keyLabel.toUpperCase()}';
  }
}

bool wasTabKeyPressedDown(KeyEvent event) {
  return event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.tab;
}

bool wasTabKeyPressedUp(KeyEvent event) {
  return event is KeyUpEvent && event.logicalKey == LogicalKeyboardKey.tab;
}

bool wasEnterKeyPressedDown(KeyEvent event) {
  return event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.enter;
}

bool wasEnterKeyPressedUp(KeyEvent event) {
  return event is KeyUpEvent && event.logicalKey == LogicalKeyboardKey.enter;
}

bool wasEscapeKeyPressedDown(KeyEvent event) {
  return event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.escape;
}

bool wasEscapeKeyPressedUp(KeyEvent event) {
  return event is KeyUpEvent && event.logicalKey == LogicalKeyboardKey.escape;
}

bool wasArrowLeftPressedDown(KeyEvent event) {
  return event is KeyDownEvent &&
      event.logicalKey == LogicalKeyboardKey.arrowLeft;
}

bool wasArrowLeftPressedUp(KeyEvent event) {
  return event is KeyUpEvent &&
      event.logicalKey == LogicalKeyboardKey.arrowLeft;
}

bool wasArrowRightPressedDown(KeyEvent event) {
  return event is KeyDownEvent &&
      event.logicalKey == LogicalKeyboardKey.arrowRight;
}

bool wasArrowRightPressedUp(KeyEvent event) {
  return event is KeyUpEvent &&
      event.logicalKey == LogicalKeyboardKey.arrowRight;
}

bool wasArrowDownPressedDown(KeyEvent event) {
  return event is KeyDownEvent &&
      event.logicalKey == LogicalKeyboardKey.arrowDown;
}

bool wasArrowDownPressedUp(KeyEvent event) {
  return event is KeyUpEvent &&
      event.logicalKey == LogicalKeyboardKey.arrowDown;
}

bool wasArrowUpPressedDown(KeyEvent event) {
  return event is KeyDownEvent &&
      event.logicalKey == LogicalKeyboardKey.arrowUp;
}

bool wasArrowUpPressedUp(KeyEvent event) {
  return event is KeyUpEvent && event.logicalKey == LogicalKeyboardKey.arrowUp;
}

class GlobalShortcutManager extends ShortcutManager {
  GlobalShortcutManager() {
    _initShortcuts();
  }

  late final Map<ShortcutActivator, Intent> _shortcuts;

  void _initShortcuts() {
    bool isAltTheActivatorKey;
    bool isCmdTheActivatorKey;

    if (Platform.isMacOS) {
      isAltTheActivatorKey = false;
      isCmdTheActivatorKey = true;
    } else {
      isAltTheActivatorKey = true;
      isCmdTheActivatorKey = false;
    }

    _shortcuts = {
      const SingleActivator(LogicalKeyboardKey.f1):
          const PageNavigationIntent(MainPageENUM.playlists),
      const SingleActivator(LogicalKeyboardKey.f2):
          const PageNavigationIntent(MainPageENUM.playlist),
      const SingleActivator(LogicalKeyboardKey.f3):
          const PageNavigationIntent(MainPageENUM.musiccenter),
      const SingleActivator(LogicalKeyboardKey.f4):
          const PageNavigationIntent(MainPageENUM.testandlab),
      SingleActivator(
        LogicalKeyboardKey.keyR,
        alt: isAltTheActivatorKey,
        meta: isCmdTheActivatorKey,
      ): const PlaylistRefreshIntent(),
    };
  }

  @override
  KeyEventResult handleKeypress(BuildContext context, RawKeyEvent event) {
    final KeyEventResult result = super.handleKeypress(context, event);
    if (result == KeyEventResult.handled) {
      debugPrint('Handled shortcut ${event.logicalKey.keyLabel}');
    }
    return result;
  }

  @override
  Map<ShortcutActivator, Intent> get shortcuts => _shortcuts;
}

/// Activated when F1-F10 is pressed
class PageNavigationIntent extends Intent {
  const PageNavigationIntent(this.toPage);

  final MainPageENUM toPage;
}

/// Activated when ALT (CMD for macOS) + S is pressed
class PlaylistRefreshIntent extends Intent {
  const PlaylistRefreshIntent();
}
