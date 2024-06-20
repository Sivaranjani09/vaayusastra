
import 'package:flutter/material.dart';
import 'level_page.dart';
import 'draggable_chatbot.dart';

class CoursesPage extends StatelessWidget {
  final List<String> catalogItems = [
    'catalog 1',
    'catalog 2',
    'catalog 3',
    'catalog 4',
    'catalog 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 27, 23, 84),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: catalogItems.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LevelPage(level: catalogItems[index]),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            catalogItems[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 27, 23, 84)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          DraggableChatbot(),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'level_page.dart';
// import 'draggable_chatbot.dart';
//  // Import the LevelPage

// class CoursesPage extends StatelessWidget {
//   final List<String> catalogItems = [
//     'Level1',
//     'Level2',
//     'Level3',
//     'Level4',
//     'Level5',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   'Categories',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blueGrey[900],
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 3 / 2,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10,
//                   ),
//                   itemCount: catalogItems.length,
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => LevelPage(level: catalogItems[index]),
//                           ),
//                         );
//                       },
//                       child: Card(
//                         elevation: 5,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Center(
//                           child: Text(
//                             catalogItems[index],
//                             textAlign: TextAlign.center,
//                             style: TextStyle(fontSize: 18),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//           DraggableChatbot(),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'catalog_detail.dart';
// import 'draggable_chatbot.dart';

// class CoursesPage extends StatelessWidget {
//   final List<String> catalogItems = [
//     'Level1',
//     'Level2',
//     'Level3',
//     'Level4',
//     'Level5',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   'Categories',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blueGrey[900],
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 3 / 2,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10,
//                   ),
//                   itemCount: catalogItems.length,
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CatalogDetailPage(item: catalogItems[index]),
//                           ),
//                         );
//                       },
//                       child: Card(
//                         elevation: 5,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Center(
//                           child: Text(
//                             catalogItems[index],
//                             textAlign: TextAlign.center,
//                             style: TextStyle(fontSize: 18),
                            
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//           DraggableChatbot(),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'catalog_detail.dart';
// import 'draggable_chatbot.dart';

// class HomePage extends StatelessWidget {
//   final List<String> catalogItems = [
//     'Level1',
//     'Level2',
//     'Level3',
//     'Level4',
//     'Level5',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Vaayusastra')),
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   'Categories',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blueGrey[900],
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 3 / 2,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10,
//                   ),
//                   itemCount: catalogItems.length,
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CatalogDetailPage(item: catalogItems[index]),
//                           ),
//                         );
//                       },
//                       child: Card(
//                         elevation: 5,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Center(
//                           child: Text(
//                             catalogItems[index],
//                             textAlign: TextAlign.center,
//                             style: TextStyle(fontSize: 18),
                            
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//           DraggableChatbot(),
//         ],
//       ),
//     );
//   }
// }
