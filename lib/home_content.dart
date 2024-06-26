// home_content.dart
import 'package:flutter/material.dart';
import 'courses_page.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Vaayusastra!',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Color.fromARGB(255, 27, 23, 84),
                  ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4,
              color: Color.fromARGB(255, 195, 194, 209),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Courses We Offer',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Color.fromARGB(255, 27, 23, 84),
                          ),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      leading: Icon(Icons.school, color: Color.fromARGB(255, 27, 23, 84)),
                      title: Text(
                        'Weekend Batches',
                        style: TextStyle(color: Color.fromARGB(255, 27, 23, 84)),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CoursesPage(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.school, color: Color.fromARGB(255, 27, 23, 84)),
                      title: Text(
                        '10 Day camp',
                        style: TextStyle(color: Color.fromARGB(255, 27, 23, 84)),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CoursesPage(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.school, color: Color.fromARGB(255, 27, 23, 84)),
                      title: Text(
                        'Online - Air science through mythology',
                        style: TextStyle(color: Color.fromARGB(255, 27, 23, 84)),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CoursesPage(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.school, color: Color.fromARGB(255, 27, 23, 84)),
                      title: Text(
                        'Advanced level college program',
                        style: TextStyle(color: Color.fromARGB(255, 27, 23, 84)),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CoursesPage(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.school, color: Color.fromARGB(255, 27, 23, 84)),
                      title: Text(
                        'AASSC certification program',
                        style: TextStyle(color: Color.fromARGB(255, 27, 23, 84)),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CoursesPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4,
              color: Color.fromARGB(255, 195, 194, 209),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Testimonials',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Color.fromARGB(255, 27, 23, 84),
                          ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'testimonials about vaaysastra',
                      style: TextStyle(color: Color.fromARGB(255, 27, 23, 84)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// class HomeContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Welcome to Vaayusastra',
//               style: Theme.of(context).textTheme.displayLarge,
//             ),
//             SizedBox(height: 20),
//             Card(
//               elevation: 4,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'About the Company',
//                       style: Theme.of(context).textTheme.titleLarge,
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'Vaayusastra is a leading company in the aerospace industry, committed to innovation and excellence. Our team of experts is dedicated to providing top-quality solutions and services to our clients.',
//                       style: Theme.of(context).textTheme.bodyMedium,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Card(
//               elevation: 4,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'About the CEO',
//                       style: Theme.of(context).textTheme.titleLarge,
//                     ),
//                     SizedBox(height: 10),
//                     Row(
//                       children: [
//                         CircleAvatar(
//                           radius: 30,
//                           backgroundImage: AssetImage('assets/ceo.jpg'), // Ensure you have a valid image asset
//                         ),
//                         SizedBox(width: 10),
//                         Expanded(
//                           child: Text(
//                             'Our CEO, John Doe, is a visionary leader with over 20 years of experience in the aerospace industry. Under his leadership, Vaayusastra has achieved significant milestones and continues to push the boundaries of innovation.',
//                             style: Theme.of(context).textTheme.bodyMedium,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';

// class HomeContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Welcome to Vaayusastra',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20),
//           Text(
//             'About the Company',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           Text(
//             'Vaayusastra is a leading company in ...',
//           ),
//           SizedBox(height: 20),
//           Text(
//             'About the CEO',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           Text(
//             'Our CEO, ...',
//           ),
//         ],
//       ),
//     );
//   }
// }
