// main_page.dart

// main_page.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_content.dart';
import 'about_us.dart';
import 'courses_page.dart';
import 'login_page.dart';
import 'payment_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static List<Widget> _pages = [
    HomeContent(),
    AboutUsPage(),
    CoursesPage(),
    Placeholder(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Vaayusastra'),
        actions: [
          TextButton.icon(
            icon: Icon(Icons.logout, color: Colors.white),
            label: Text('Logout', style: TextStyle(color: Colors.white)),
            onPressed: _logout,
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 27, 23, 84),
              ),
              child: Text(
                'More Options',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.payment, color: Color.fromARGB(255, 27, 23, 84)),
              title: Text('Payment'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentPage()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_vert),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 27, 23, 84),
        unselectedItemColor: Color.fromARGB(255, 27, 23, 84),
        unselectedLabelStyle: TextStyle(color: Color.fromARGB(255, 27, 23, 84)), // Ensure unselected labels are also visible
        selectedLabelStyle: TextStyle(color: Color.fromARGB(255, 27, 23, 84)), // Ensure selected labels are in primary color
        onTap: (index) {
          if (index == 3) {
            _scaffoldKey.currentState?.openDrawer();
          } else {
            _onItemTapped(index);
          }
        },
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'home_content.dart';
// import 'about_us.dart';
// import 'courses_page.dart';
// import 'payment_page.dart';

// class MainPage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   int _selectedIndex = 0;

//   static List<Widget> _pages = [
//     HomeContent(),
//     AboutUsPage(),
//     CoursesPage(),
//     Placeholder(), // Placeholder for additional pages
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(title: Text('Vaayusastra')),
//       body: _pages[_selectedIndex],
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 27, 23, 84),
//               ),
//               child: Text(
//                 'More Options',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.payment, color: Color.fromARGB(255, 27, 23, 84)),
//               title: Text('Payment'),
//               onTap: () {
//                 Navigator.pop(context); // Close the drawer
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => PaymentPage()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.info),
//             label: 'About Us',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.book),
//             label: 'Courses',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.more_vert),
//             label: 'More',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Color.fromARGB(255, 27, 23, 84),
//         unselectedItemColor: Colors.grey,
//         onTap: (index) {
//           if (index == 3) {
//             _scaffoldKey.currentState?.openDrawer();
//           } else {
//             _onItemTapped(index);
//           }
//         },
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'home_content.dart';
// import 'about_us.dart';
// import 'courses_page.dart';
// import 'payment_page.dart';

// class MainPage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   int _selectedIndex = 0;

//   static List<Widget> _pages = [
//     HomeContent(),
//     AboutUsPage(),
//     CoursesPage(),
//     Placeholder(), // Placeholder for additional pages
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(title: Text('Vaayusastra')),
//       body: _pages[_selectedIndex],
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text(
//                 'More Options',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.payment),
//               title: Text('Payment'),
//               onTap: () {
//                 Navigator.pop(context); // Close the drawer
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => PaymentPage()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.info),
//             label: 'About Us',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.book),
//             label: 'Courses',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.more_vert),
//             label: 'More',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.blueAccent,
//         unselectedItemColor: Colors.grey,
//         onTap: (index) {
//           if (index == 3) {
//             _scaffoldKey.currentState?.openDrawer();
//           } else {
//             _onItemTapped(index);
//           }
//         },
//       ),
//     );
//   }
// }





