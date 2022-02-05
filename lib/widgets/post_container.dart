import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_facebook/config/palette.dart';

import '/models/models.dart';
import '/widgets/widgets.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                SizedBox(
                  height: 10,
                ),
                Text(post.caption),
                if (post.imageUrl != 'null')
                  SizedBox(
                    height: 10,
                  ),
              ],
            ),
          ),
          if (post.imageUrl != 'null')
            CachedNetworkImage(imageUrl: post.imageUrl),
          Padding(
            padding: const EdgeInsets.all(15),
            child: _PostStats(post: post),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              height: 0,
              thickness: 0.8,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _PostButton(
                  icon: Icons.thumb_up_outlined, label: 'Like', onTap: () {}),
              _PostButton(
                  icon: Icons.comment_outlined, label: 'Comment', onTap: () {}),
              _PostButton(
                  icon: Icons.share_outlined, label: 'Share', onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  const _PostHeader({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileAvatar(imgUrl: post.user.imageUrl),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.user.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  '${post.timeAgo} • ',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                Icon(
                  Icons.public,
                  size: 14,
                  color: Colors.grey[600],
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        Icon(
          Icons.more_horiz_rounded,
          color: Colors.grey[600],
        ),
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  const _PostStats({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Palette.facebookBlue,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.thumb_up_rounded,
            color: Colors.white,
            size: 12,
          ),
        ),
        SizedBox(width: 5),
        Text(
          '${post.likes}',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
        Spacer(),
        Text(
          '${post.comments} Comments  •  ${post.shares} Shares',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  const _PostButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.grey[600],
                  size: 20,
                ),
                SizedBox(width: 5),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
