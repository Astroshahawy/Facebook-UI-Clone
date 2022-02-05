import 'package:flutter/material.dart';
import '/models/models.dart';
import '/widgets/widgets.dart';

class CreatePostContainer extends StatelessWidget {
  const CreatePostContainer({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: ProfileAvatar(imgUrl: currentUser.imageUrl),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: ButtonTheme(
                    height: 30,
                    child: OutlineButton(
                      padding: EdgeInsets.only(left: 25),
                      onPressed: () {},
                      borderSide: BorderSide(
                        width: 0.2,
                        color: Colors.black,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      highlightedBorderColor: Colors.black,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'What\'s on your mind?',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            height: 0,
            thickness: 0.8,
          ),
          Container(
            height: 40,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.videocam,
                    color: Colors.red,
                    size: 20,
                  ),
                  label: Text(
                    'Live',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                VerticalDivider(),
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.photo_library,
                    color: Colors.green,
                    size: 20,
                  ),
                  label: Text(
                    'Photo',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                VerticalDivider(),
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.video_call,
                    color: Colors.purple,
                    size: 20,
                  ),
                  label: Text(
                    'Room',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
