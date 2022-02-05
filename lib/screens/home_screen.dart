import 'package:flutter/material.dart';

import '/config/palette.dart';
import '/data/data.dart';
import '/models/models.dart';
import '/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                'facebook',
                style: TextStyle(
                  color: Palette.facebookBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  letterSpacing: -1.2,
                ),
              ),
              actions: [
                CircleButton(
                  icon: Icons.search,
                  iconSize: 22,
                  onPress: () {},
                ),
                CircleButton(
                  icon: Icons.facebook,
                  iconSize: 22,
                  onPress: () {},
                ),
                SizedBox(width: 5),
              ],
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: Delgate(
                child: PreferredSize(
                  preferredSize: Size.fromHeight(50),
                  child: Container(
                    height: 50,
                    color: Colors.white,
                    child: CustomTabBar(),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: CreatePostContainer(currentUser: currentUser),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
              sliver: SliverToBoxAdapter(
                child: Rooms(onlineUsers: onlineUsers),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              sliver: SliverToBoxAdapter(
                child: Stories(currentUser: currentUser, stories: stories),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  Post post = posts[index];
                  return PostContainer(post: post);
                },
                childCount: posts.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Delgate extends SliverPersistentHeaderDelegate {
  final PreferredSize child;
  Delgate({
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
