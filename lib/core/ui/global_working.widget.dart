import 'package:djsportsdesktop/core/core.dart';
import 'package:djsportsdesktop/core/extensions.dart';
import 'package:djsportsdesktop/core/ui/global_working_indicator.widget.dart';
import 'package:flutter/material.dart';

class GlobalWorkingWidget extends StatelessWidget {
  const GlobalWorkingWidget({
    Key? key,
    required this.text,
    this.cancelAvailable = false,
  }) : super(key: key);

  final String text;
  final bool cancelAvailable;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Text(
              text,
              style: context
                  .textTheme()
                  .titleLarge
                  ?.apply(color: context.colorTheme().onSurfaceMedium),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
          ),
          const GlobalWorkingIndicatorWidget(size: 50),
          if (cancelAvailable) ...[
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ElevatedButton(
                onPressed: Navigator.of(context).pop,
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                child: const Text('Avbryt'),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
