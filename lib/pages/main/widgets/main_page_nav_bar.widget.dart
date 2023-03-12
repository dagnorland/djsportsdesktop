import 'package:flutter/material.dart';

import 'package:djsportsdesktop/core/core.dart';
import 'package:djsportsdesktop/l10n.dart';
import 'package:djsportsdesktop/pages/main/enums.dart';

class MainPageNavBarWidget extends StatelessWidget {
  const MainPageNavBarWidget({
    required this.currentPage,
    required this.onNavItemSelected,
    super.key,
  });

  final MainPageENUM currentPage;
  final ValueChanged<MainPageENUM> onNavItemSelected;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colorTheme().navBarBackgroundColor,
      child: Row(
        children: [
          NavItemWidget(
            hotKey: 'F1',
            label: $t(context).navBarLabelPlaylists.toUpperCase(),
            isActive: currentPage == MainPageENUM.playlists,
            onTap: () => onNavItemSelected(MainPageENUM.playlists),
          ),
        ],
      ),
    );
  }
}

class NavItemWidget extends StatelessWidget {
  const NavItemWidget({
    required this.label,
    required this.hotKey,
    required this.isActive,
    required this.onTap,
    super.key,
  });

  final String label;
  final String hotKey;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppSizes.navBarHeight,
        width: AppSizes.navBarItemWidth,
        decoration: BoxDecoration(
          color: isActive
              ? context.colorTheme().navBarItemBackgroundColorActive
              : null,
          border: isActive
              ? Border(
                  bottom:
                      BorderSide(color: context.colorTheme().surface, width: 2))
              : null,
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('($hotKey)', style: context.textTheme().labelSmall),
            Text(label,
                style: context
                    .textTheme()
                    .buttonLarge!
                    .copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
