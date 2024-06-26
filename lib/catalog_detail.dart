import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'payment_page.dart'; // Import the PaymentPage

class CourseDetailPage extends StatelessWidget {
  final Map<String, dynamic> course;

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
            Center(
              child: ElevatedButton(
                onPressed: () => _launchURL(course['driveLink']!),
                child: Text('Open Course Content'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 15, 15, 17),
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
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
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}



// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'payment_page.dart'; // Import the PaymentPage

// class CourseDetailPage extends StatelessWidget {
//   final Map<String, dynamic> course;

//   CourseDetailPage({required this.course});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(course['title']!),
//         backgroundColor: Color.fromARGB(255, 27, 23, 84),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Icon(
//               Icons.book,
//               size: 100,
//               color: Color.fromARGB(255, 27, 23, 84),
//             ),
//             SizedBox(height: 20),
//             Text(
//               course['title']!,
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromARGB(255, 27, 23, 84),
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(course['description']!),
//             SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () => _launchURL(course['driveLink']),
//                 child: Text('Open Course Content'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color.fromARGB(255, 15, 15, 17),
//                   padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => PaymentPage()),
//                   );
//                 },
//                 child: Text('Purchase Course'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color.fromARGB(255, 27, 23, 84),
//                   padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _launchURL(String url) async {
//     final Uri uri = Uri.parse(url);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }
  




// import 'package:flutter/material.dart';
// import 'payment_page.dart'; // Import the PaymentPage

// class CourseDetailPage extends StatelessWidget {
//   final Map<String, String> course;

//   CourseDetailPage({required this.course});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(course['title']!),
//         backgroundColor: Color.fromARGB(255, 27, 23, 84),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Icon(
//               Icons.book,
//               size: 100,
//               color: Color.fromARGB(255, 27, 23, 84),
//             ),
//             SizedBox(height: 20),
//             Text(
//               course['title']!,
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromARGB(255, 27, 23, 84),
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(course['description']!),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => PaymentPage()),
//                 );
//               },
//               child: Text('Purchase Course'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color.fromARGB(255, 27, 23, 84),
//                 padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



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


