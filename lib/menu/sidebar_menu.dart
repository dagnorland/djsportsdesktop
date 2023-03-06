import 'dart:math' as math show pi;

import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';

class SidebarPage extends StatefulWidget {
  const SidebarPage({super.key});

  @override
  SidebarPageState createState() => SidebarPageState();
}

class SidebarPageState extends State<SidebarPage> {
  List<CollapsibleItem> _items = [];
  String _headline = '';

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'MusicCenter',
        icon: Icons.sports_handball_outlined,
        onPressed: () => setState(() => _headline = 'MusicCenter'),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Playlist',
        icon: Icons.featured_play_list_outlined,
        onPressed: () => setState(() => _headline = 'Playlist'),
      ),
      CollapsibleItem(
        text: 'Music Library',
        icon: Icons.queue_music,
        onPressed: () => setState(() => _headline = 'Music Library'),
      ),
      CollapsibleItem(
        text: 'Config & lab',
        icon: Icons.settings,
        onPressed: () => setState(() => _headline = 'Config & lab'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: CollapsibleSidebar(
        isCollapsed: MediaQuery.of(context).size.width <= 800,
        items: _items,
        collapseOnBodyTap: false,
        title: 'DJSportsDesktop',
        onTitleTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Welcome to DJSportsDesktop!')));
        },
        body: _body(size, context),
        backgroundColor: Colors.black,
        selectedTextColor: Colors.limeAccent,
        textStyle: const TextStyle(fontSize: 20, fontStyle: FontStyle.normal),
        titleStyle: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold),
        toggleTitleStyle:
            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        sidebarBoxShadow: const [
          BoxShadow(
            color: Colors.indigo,
            blurRadius: 20,
            spreadRadius: 0.01,
            offset: Offset(3, 3),
          ),
          BoxShadow(
            color: Colors.green,
            blurRadius: 50,
            spreadRadius: 0.01,
            offset: Offset(3, 3),
          ),
        ],
      ),
    );
  }

  Widget _body(Size size, BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blueGrey[50],
      child: Center(
        child: Transform.rotate(
          angle: math.pi / 2,
          child: Transform.translate(
            offset: Offset(-size.height * 0.2, -size.width * 0.4),
            child: Text(
              _headline,
              style: Theme.of(context).textTheme.headline1,
              overflow: TextOverflow.visible,
              softWrap: false,
            ),
          ),
        ),
      ),
    );
  }
}
