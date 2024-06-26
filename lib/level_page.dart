import 'package:flutter/material.dart';
import 'catalog_detail.dart'; // Import the CourseDetailPage

class LevelPage extends StatelessWidget {
  final String level;

  LevelPage({required this.level});

  final List<Map<String, String>> courses = [
    {
      'title': 'Course 1',
      'description': 'Description of Course 1',
      'driveLink': 'https://drive.google.com/course1',
    },
    {
      'title': 'Course 2',
      'description': 'Description of Course 2',
      'driveLink': 'https://drive.google.com/course2',
    },
    // Add more courses as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$level Courses'),
        backgroundColor: Color.fromARGB(255, 27, 23, 84),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return Card(
            color: Color.fromARGB(255, 223, 222, 230), // Set the card color here
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: Icon(
                Icons.book,
                color: Color.fromARGB(255, 27, 23, 84),
                size: 40,
              ),
              title: Text(
                courses[index]['title']!,
                style: TextStyle(
                  color: Color.fromARGB(255, 27, 23, 84),
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                courses[index]['description']!,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: Color.fromARGB(255, 27, 23, 84),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseDetailPage(course: courses[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'catalog_detail.dart'; // Import the CourseDetailPage

// class LevelPage extends StatelessWidget {
//   final String level;

//   LevelPage({required this.level});

//   final List<Map<String, String>> courses = [
//     {
//       'title': 'Course 1',
//       'description': 'Description of Course 1',
//       'driveLink': 'https://drive.google.com/course1',
//     },
//     {
//       'title': 'Course 2',
//       'description': 'Description of Course 2',
//       'driveLink': 'https://drive.google.com/course2',
//     },
//     // Add more courses as needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('$level Courses'),
//         backgroundColor: Color.fromARGB(255, 27, 23, 84),
//       ),
//       body: ListView.builder(
//         itemCount: courses.length,
//         itemBuilder: (context, index) {
//           return Card(
//             margin: EdgeInsets.all(10),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: ListTile(
//               leading: Icon(
//                 Icons.book,
//                 color: Color.fromARGB(255, 27, 23, 84),
//                 size: 40,
//               ),
//               title: Text(
//                 courses[index]['title']!,
//                 style: TextStyle(color: Color.fromARGB(255, 27, 23, 84)),
//               ),
//               subtitle: Text(courses[index]['description']!),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => CourseDetailPage(course: courses[index]),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import 'catalog_detail.dart'; // Import the CourseDetailPage

// class LevelPage extends StatelessWidget {
//   final String level;

//   LevelPage({required this.level});

//   final List<Map<String, String>> courses = [
//     {
//       'title': 'Course 1',
//       'description': 'Description of Course 1',
//     },
//     {
//       'title': 'Course 2',
//       'description': 'Description of Course 2',
//     },
//     // Add more courses as needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('$level Courses'),
//         backgroundColor: Color.fromARGB(255, 27, 23, 84),
//       ),
//       body: ListView.builder(
//         itemCount: courses.length,
//         itemBuilder: (context, index) {
//           return Card(
//             margin: EdgeInsets.all(10),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: ListTile(
//               leading: Icon(
//                 Icons.book,
//                 color: Color.fromARGB(255, 27, 23, 84),
//                 size: 40,
//               ),
//               title: Text(
//                 courses[index]['title']!,
//                 style: TextStyle(color: Color.fromARGB(255, 27, 23, 84)),
//               ),
//               subtitle: Text(courses[index]['description']!),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => CourseDetailPage(course: courses[index]),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'catalog_detail.dart'; // Import the CourseDetailPage

// class LevelPage extends StatelessWidget {
//   final String level;

//   LevelPage({required this.level});

//   final List<Map<String, String>> courses = [
//     {
//       'title': 'Course 1',
//       'description': 'Description of Course 1',
//       'image': 'assets/course1.jpg',
//     },
//     {
//       'title': 'Course 2',
//       'description': 'Description of Course 2',
//       'image': 'assets/course2.jpg',
//     },
//     // Add more courses as needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('$level Courses')),
//       body: ListView.builder(
//         itemCount: courses.length,
//         itemBuilder: (context, index) {
//           return Card(
//             margin: EdgeInsets.all(10),
//             child: ListTile(
//               leading: Image.asset(courses[index]['image']!),
//               title: Text(courses[index]['title']!),
//               subtitle: Text(courses[index]['description']!),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => CourseDetailPage(course: courses[index]),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
