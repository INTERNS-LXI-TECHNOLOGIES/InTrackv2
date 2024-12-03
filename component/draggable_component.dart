import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DraggablePopup(),
    );
  }
}

class DraggablePopup extends StatefulWidget {
  @override
  _DraggablePopupState createState() => _DraggablePopupState();
}

class _DraggablePopupState extends State<DraggablePopup> {
  double _top = 200.0; // Initial top position
  double _left = 100.0; // Initial left position
  bool _isPopupVisible = false; // Visibility of the popup options

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          // Draggable Circle
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isPopupVisible = !_isPopupVisible;
                });
              },
              child: Draggable(
                feedback: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.add, color: Colors.white),
                ),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.add, color: Colors.white),
                ),
                childWhenDragging: Container(),
                onDragEnd: (details) {
                  setState(() {
                    _top = details.offset.dy;
                    _left = details.offset.dx;
                  });
                },
              ),
            ),
          ),

          // Popup Options
          if (_isPopupVisible) ...[
            Positioned(
              top: _top - 70,
              left: _left,
              child: _buildPopupOption(Icons.chat, Colors.purple, () {
                print('Chat clicked');
              }),
            ),
            Positioned(
              top: _top,
              left: _left + 70,
              child: _buildPopupOption(Icons.settings, Colors.orange, () {
                print('Settings clicked');
              }),
            ),
            Positioned(
              top: _top + 70,
              left: _left,
              child: _buildPopupOption(Icons.camera, Colors.green, () {
                print('Camera clicked');
              }),
            ),
            Positioned(
              top: _top,
              left: _left - 70,
              child: _buildPopupOption(Icons.share, Colors.red, () {
                print('Share clicked');
              }),
            ),
          ],
        ],
      ),
    );
  }

  // Helper method to build a popup option
  Widget _buildPopupOption(IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: color,
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}
