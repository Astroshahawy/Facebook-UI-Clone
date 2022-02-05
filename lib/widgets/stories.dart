import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook/widgets/widgets.dart';
import '/config/palette.dart';

import '/models/models.dart';

class Stories extends StatelessWidget {
  const Stories({
    Key? key,
    required this.currentUser,
    required this.stories,
  }) : super(key: key);

  final User currentUser;
  final List<Story> stories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Colors.white,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 11),
        itemCount: 1 + stories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _StoryCard(
              currentUser: currentUser,
              isCurrentUser: true,
              isAddStory: true,
            );
          }
          final Story story = stories[index - 1];
          return _StoryCard(
            story: story,
          );
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard({
    Key? key,
    this.story,
    this.currentUser,
    this.isAddStory = false,
    this.isCurrentUser = false,
  }) : super(key: key);

  final User? currentUser;
  final bool isAddStory;
  final bool isCurrentUser;
  final Story? story;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        height: double.infinity,
        width: 110,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: isCurrentUser
                  ? BorderRadius.vertical(
                      top: Radius.circular(12),
                    )
                  : BorderRadius.circular(12),
              child: CachedNetworkImage(
                height: isCurrentUser ? 150 : double.infinity,
                imageUrl: isAddStory ? currentUser!.imageUrl : story!.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            if (!isCurrentUser)
              Container(
                height: isCurrentUser ? 150 : double.infinity,
                width: 110,
                decoration: BoxDecoration(
                  gradient: Palette.storyGradient,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            if (isCurrentUser)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(12),
                    ),
                  ),
                ),
              ),
            if (!isCurrentUser)
              Positioned(
                left: 8,
                top: 8,
                child: ProfileAvatar(
                  imgUrl: story!.user.imageUrl,
                  isStoryViewed: story!.isViewed,
                  hasBorder: true,
                ),
              ),
            if (isCurrentUser)
              Positioned(
                left: 0,
                right: 0,
                bottom: 60,
                child: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: CircleAvatar(
                    radius: 17,
                    child: Icon(
                      Icons.add_rounded,
                      color: Colors.grey[200],
                      size: 35,
                    ),
                    backgroundColor: Palette.facebookBlue,
                  ),
                ),
              ),
            Positioned(
              left: 8,
              right: 8,
              bottom: 8,
              child: Text(
                isAddStory ? 'Create Story' : story!.user.name,
                textAlign: isAddStory ? TextAlign.center : TextAlign.start,
                style: TextStyle(
                  color: isAddStory ? Colors.black : Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300]!,
                  width: isCurrentUser ? 2 : 0.5,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              height: double.infinity,
              width: 110,
            ),
          ],
        ),
      ),
    );
  }
}
