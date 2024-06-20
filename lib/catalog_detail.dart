
import 'package:flutter/material.dart';
import 'payment_page.dart'; // Import the PaymentPage

class CourseDetailPage extends StatelessWidget {
  final Map<String, String> course;

  CourseDetailPage({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course['title']!),
        backgroundColor: Color.fromARGB(255, 27, 23, 84),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.book,
              size: 100,
              color: Color.fromARGB(255, 27, 23, 84),
            ),
            SizedBox(height: 20),
            Text(
              course['title']!,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 27, 23, 84),
              ),
            ),
            SizedBox(height: 10),
            Text(course['description']!),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentPage()),
                );
              },
              child: Text('Purchase Course'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 27, 23, 84),
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'payment_page.dart'; // Import the PaymentPage

// class CourseDetailPage extends StatelessWidget {
//   final Map<String, String> course;

//   CourseDetailPage({required this.course});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(course['title']!)),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset(course['image']!),
//             SizedBox(height: 20),
//             Text(
//               course['title']!,
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text(course['description']!),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => PaymentPage(
//                   )),
//                 );
//               },
//               child: Text('Purchase Course'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'draggable_chatbot.dart';

// class CatalogDetailPage extends StatelessWidget {
//   final String item;

//   CatalogDetailPage({required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('$item Details')),
//       body: Stack(
//         children: [
//           Center(child: Text('Details of $item')),
//           DraggableChatbot(), // Place the DraggableChatbot here
//         ],
//       ),
//     );
//   }
// }
