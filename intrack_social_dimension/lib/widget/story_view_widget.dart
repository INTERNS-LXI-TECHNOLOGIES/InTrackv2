import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intrack_social_dimension/model/text_story.dart';
import 'package:intrack_social_dimension/widget/story_widget.dart';
import 'package:intrack_social_dimension/model/text_story.dart';

class StoryViewWidget extends StatefulWidget {
  @override
  _StoryViewWidgetState createState() => _StoryViewWidgetState();
}

class _StoryViewWidgetState extends State<StoryViewWidget> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _onFacebookPressed() {
    print("Facebook button pressed!");
  }

  void _onSendPressed() {
    if (_commentController.text.isNotEmpty) {
      print("Comment Sent: ${_commentController.text}");
      _commentController.clear();
    } else {
      print("Comment box is empty!");
    }
  }

void _deletestory() {
  setState(() {
    TextStory.storyText.clear();
  });

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Story deleted'),
      duration: Duration(seconds: 2),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Content
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/images/profile_pic.png'), // Use local image
                            radius: 16,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Your story",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        color: Colors.white,
                        onPressed: () {
                          print("Close button pressed");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => StoryWidget()),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // Main message
                Expanded(
                  child: Center(
                    child: Text(
                      // Displaying text from TextStory
                      TextStory.storyText.isNotEmpty
                          ? TextStory.storyText.join('\n')
                          : "No story to display",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Bottom bar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Divider(color: Colors.white54),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _commentController,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                            decoration: InputDecoration(
                              hintText: "Add a comment...",
                              hintStyle: TextStyle(color: Colors.white54),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.facebook, color: Colors.white),
                              onPressed: _onFacebookPressed,
                            ),
                            IconButton(
                              icon: Icon(Icons.send, color: Colors.white),
                              onPressed: _onSendPressed,
                            ),
                                  IconButton(
                                    icon: Icon(Icons.more_horiz, color: Colors.white),
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                        ),
                                        builder: (BuildContext context) {
                                          return Container(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                  ListTile(
                                                    title: Text(
                                                      'Delete story',
                                                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                    ),
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                      _deletestory();
                                                    },
                                                  ),
                                                ListTile(
                                                  title: Text('Save', style: TextStyle(color: Colors.white)),
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    // Add save functionality here
                                                  },
                                                ),
                                                ListTile(
                                                  title: Text('Share as post', style: TextStyle(color: Colors.white)),
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    // Add share as post functionality here
                                                  },
                                                ),
                                                ListTile(
                                                  title: Text('Turn off commenting', style: TextStyle(color: Colors.white)),
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    // Add turn off commenting functionality here
                                                  },
                                                ),
                                                Divider(color: Colors.white24),
                                                ListTile(
                                                  title: Text('Cancel', textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
