import 'package:flutter/material.dart';

import 'package:flutter_facebook/config/palette.dart';

class CustomTabBar extends StatefulWidget {
  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      labelColor: Palette.facebookBlue,
      unselectedLabelColor: Colors.grey[600],
      indicatorWeight: 3,
      tabs: [
        Tab(
          icon: Icon(
            Icons.home,
            size: 28,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.groups,
            size: 28,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.account_circle,
            size: 28,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.notifications,
            size: 28,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.menu,
            size: 28,
          ),
        ),
      ],
    );
  }
}
