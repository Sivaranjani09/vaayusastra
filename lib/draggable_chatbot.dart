import 'package:flutter/material.dart';
import 'chatbot_page.dart';

class DraggableChatbot extends StatefulWidget {
  @override
  _DraggableChatbotState createState() => _DraggableChatbotState();
}

class _DraggableChatbotState extends State<DraggableChatbot> {
  double _xOffset = 50.0;
  double _yOffset = 50.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: _xOffset,
          top: _yOffset,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatbotPage()),
              );
            },
            onPanUpdate: (details) {
              setState(() {
                _xOffset += details.delta.dx;
                _yOffset += details.delta.dy;
              });
            },
            child: FloatingActionButton(
              onPressed: null, // Do nothing, as we handle navigation onTap
              child: Icon(Icons.chat),
            ),
          ),
        ),
      ],
    );
  }
}
