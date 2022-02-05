import 'package:flutter/material.dart';
import 'package:flutter_facebook/config/palette.dart';

import 'package:flutter_facebook/models/models.dart';
import 'package:flutter_facebook/widgets/widgets.dart';

class Rooms extends StatelessWidget {
  const Rooms({
    Key? key,
    required this.onlineUsers,
  }) : super(key: key);

  final List<User> onlineUsers;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
        itemCount: 1 + onlineUsers.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _CreateRoomButton();
          }
          final User user = onlineUsers[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ProfileAvatar(
              imgUrl: user.imageUrl,
              isActive: true,
            ),
          );
        },
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: OutlineButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        borderSide: BorderSide(
          color: Colors.blueAccent[100]!,
          width: 3,
        ),
        textColor: Palette.facebookBlue,
        onPressed: () {},
        child: Row(
          children: [
            ShaderMask(
              shaderCallback: (rect) =>
                  Palette.createRoomGradient.createShader(rect),
              child: Icon(
                Icons.video_call,
                color: Colors.white,
                size: 28,
              ),
            ),
            SizedBox(width: 4),
            Text('Create\nRoom'),
          ],
        ),
      ),
    );
  }
}
