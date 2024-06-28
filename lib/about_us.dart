// about_us.dart
// about_us.dart
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Us',
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
                    Icon(Icons.rocket, color: Color.fromARGB(255, 27, 23, 84), size: 30),
                    SizedBox(height: 10),
                    Text(
                      'Our Mission',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Color.fromARGB(255, 27, 23, 84),
                          ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Vaayusastra Aerospace Private Limited, incubated under IIT Madras\'s RTBI, is dedicated to advancing the aerospace industry through innovative human engineering services, Aero Modelling workshops, science workshops for children, and theatre arts like Storytelling. We are committed to nurturing young talents, providing internships for engineering students, and fostering their ideas.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Color.fromARGB(255, 27, 23, 84),
                          ),
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
                    Icon(Icons.star, color: Color.fromARGB(255, 27, 23, 84), size: 30),
                    SizedBox(height: 10),
                    Text(
                      'Our Values',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Color.fromARGB(255, 27, 23, 84),
                          ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'At Vaayusastra, we uphold Integrity, Excellence, Innovation, and Customer Focus as our core values. These values drive us to do the right thing, deliver the best, continuously innovate, and prioritize our customers\' needs.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Color.fromARGB(255, 27, 23, 84),
                          ),
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
                    Icon(Icons.group, color: Color.fromARGB(255, 27, 23, 84), size: 30),
                    SizedBox(height: 10),
                    Text(
                      'Our Team',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Color.fromARGB(255, 27, 23, 84),
                          ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'We take pride in our diverse and talented team of professionals at Vaayusastra Aerospace Private Limited. Each member brings unique skills and expertise, collaborating effectively to achieve our goals and propel the company forward.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Color.fromARGB(255, 27, 23, 84),
                          ),
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
                    Icon(Icons.contact_mail, color: Color.fromARGB(255, 27, 23, 84), size: 30),
                    SizedBox(height: 10),
                    Text(
                      'Contact Us',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Color.fromARGB(255, 27, 23, 84),
                          ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'If you have any questions or need further information, please feel free to contact us. We are here to help and look forward to hearing from you.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Color.fromARGB(255, 27, 23, 84),
                          ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.email, color: Color.fromARGB(255, 27, 23, 84)),
                        SizedBox(width: 10),
                        Text(
                          'contact@vaayusastra.com',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Color.fromARGB(255, 27, 23, 84),
                              ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.phone, color: Color.fromARGB(255, 27, 23, 84)),
                        SizedBox(width: 10),
                        Text(
                          '+1 (800) 123-4567',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Color.fromARGB(255, 27, 23, 84),
                              ),
                        ),
                      ],
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

// class AboutUsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'About Us',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20),
//           Text(
//             'Vaayusastra is committed to providing the highest quality  education...',
//           ),
//           SizedBox(height: 20),
//           Text(
//             'Courses We Offer',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           Text(
//             'We offer a variety of courses including ...',
//           ),
//         ],
//       ),
//     );
//   }
// }
