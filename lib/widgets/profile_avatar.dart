import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook/config/palette.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    Key? key,
    required this.imgUrl,
    this.isActive = false,
    this.hasBorder = false,
    this.isStoryViewed = false,
  }) : super(key: key);

  final String imgUrl;
  final bool isActive;
  final bool hasBorder;
  final bool isStoryViewed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor:
              isStoryViewed ? Colors.grey[200] : Palette.facebookBlue,
          child: CircleAvatar(
            radius: hasBorder ? 17 : 20,
            backgroundColor: Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(imgUrl),
          ),
        ),
        if (isActive)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
                border: Border.all(width: 2, color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}
