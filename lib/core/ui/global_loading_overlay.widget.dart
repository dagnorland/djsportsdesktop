import 'package:djsportsdesktop/core/ui/global_working.widget.dart';
import 'package:djsportsdesktop/core/ui/ui.dart';
import 'package:flutter/material.dart';

class _LoadingState {
  _LoadingState._({required this.isLoading, this.text});
  _LoadingState.loading({String? text}) : this._(isLoading: true, text: text);
  _LoadingState.none() : this._(isLoading: false);

  bool isLoading;
  String? text;
}

class GlobalLoadingOverlayWidget extends StatefulWidget {
  const GlobalLoadingOverlayWidget({
    Key? key,
    this.isLoading = false,
    this.loadingText,
    required this.child,
  }) : super(key: key);

  final bool isLoading;
  final String? loadingText;
  final Widget child;

  static GlobalLoadingOverlayWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<GlobalLoadingOverlayWidgetState>()!;
  }

  @override
  State<GlobalLoadingOverlayWidget> createState() =>
      GlobalLoadingOverlayWidgetState();
}

class GlobalLoadingOverlayWidgetState
    extends State<GlobalLoadingOverlayWidget> {
  late _LoadingState _loadingState;

  void show({String? text}) {
    if (!_loadingState.isLoading) {
      setState(() {
        _loadingState = _LoadingState.loading(text: text ?? widget.loadingText);
      });
    }
  }

  void hide() {
    if (_loadingState.isLoading) {
      setState(() {
        _loadingState = _LoadingState.none();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadingState = widget.isLoading
        ? _LoadingState.loading(text: widget.loadingText)
        : _LoadingState.none();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          widget.child,
          if (_loadingState.isLoading) ...[
            const Opacity(
              opacity: 0.3,
              child: ModalBarrier(dismissible: false, color: Colors.black),
            ),
            Center(child: GlobalWorkingWidget(text: _loadingState.text ?? '')),
          ],
        ],
      ),
    );
  }
}
