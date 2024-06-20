import 'package:flutter/material.dart';

class ChatbotPage extends StatefulWidget {
  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];

  @override
  void initState() {
    super.initState();
    _messages.add({"sender": "bot", "text": "Hello! Welcome to Vaayusastra. How can I assist you today?"});
  }

  void _handleSend(String text) {
    setState(() {
      _messages.add({"sender": "user", "text": text});
      _messages.add({"sender": "bot", "text": _getBotResponse(text)});
    });
    _controller.clear();
  }

  String _getBotResponse(String query) {
    // Simple predefined responses
    if (query.toLowerCase().contains('hello')) {
      return 'Hello! How can I help you?';
    } else if (query.toLowerCase().contains('contact details')) {
      return 'You can reach us at contact@vaayusastra.com or call us at +1 234 567 8901.';
    } else if (query.toLowerCase().contains('address')) {
      return 'Our office is located at 123 Main Street, Springfield, USA.';
    } else if (query.toLowerCase().contains('courses offered')) {
      return 'We offer courses in Aerodynamics, Fluid Mechanics, Computational Fluid Dynamics, and more. Visit our website for more details.';
    } else if (query.toLowerCase().contains('price')) {
      return 'The price is \$100.';
    } else if (query.toLowerCase().contains('availability')) {
      return 'The item is in stock.';
    } else {
      return 'I am not sure how to respond to that. Please ask something else.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chatbot')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUser = message["sender"] == "user";
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blue[100] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(message["text"]!),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Type your message'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _handleSend(_controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
