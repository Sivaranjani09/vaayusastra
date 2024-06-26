// main.dart
// main.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'main_page.dart';
import 'splash_screen.dart';
import 'onboarding_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Color primaryColor = Color.fromARGB(255, 27, 23, 84);
  final Color secondaryColor = Colors.orangeAccent;

  Future<Widget> _getInitialPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    bool onboardingComplete = prefs.getBool('onboardingComplete') ?? false;
    
    if (!onboardingComplete) {
      return OnboardingPage();
    } else {
      return isLoggedIn ? MainPage() : LoginPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vaayusastra',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MaterialColor(
            primaryColor.value,
            {
              50: primaryColor.withOpacity(0.1),
              100: primaryColor.withOpacity(0.2),
              200: primaryColor.withOpacity(0.3),
              300: primaryColor.withOpacity(0.4),
              400: primaryColor.withOpacity(0.5),
              500: primaryColor.withOpacity(0.6),
              600: primaryColor.withOpacity(0.7),
              700: primaryColor.withOpacity(0.8),
              800: primaryColor.withOpacity(0.9),
              900: primaryColor,
            },
          ),
        ).copyWith(
          secondary: secondaryColor,
        ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: primaryColor),
          titleLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: primaryColor),
          bodyMedium: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: primaryColor,
          titleTextStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(12.0),
          ),
          labelStyle: TextStyle(color: primaryColor),
        ),
      ),
      home: FutureBuilder<Widget>(
        future: _getInitialPage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          } else {
            return snapshot.data!;
          }
        },
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'login_page.dart';
// import 'main_page.dart';
// import 'splash_screen.dart';

// void main() {
//   runApp(MyApp());
// }
// //https://github.com/Sivaranjani09/vaayusastra.git
// //Color.fromARGB(255, 27, 23, 84);
// class MyApp extends StatelessWidget {
//   final Color primaryColor = Color.fromARGB(255, 27, 23, 84);
//   final Color secondaryColor = Colors.orangeAccent;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Vaayusastra',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSwatch(
//           primarySwatch: MaterialColor(
//             primaryColor.value,
//             {
//               50: primaryColor.withOpacity(0.1),
//               100: primaryColor.withOpacity(0.2),
//               200: primaryColor.withOpacity(0.3),
//               300: primaryColor.withOpacity(0.4),
//               400: primaryColor.withOpacity(0.5),
//               500: primaryColor.withOpacity(0.6),
//               600: primaryColor.withOpacity(0.7),
//               700: primaryColor.withOpacity(0.8),
//               800: primaryColor.withOpacity(0.9),
//               900: primaryColor,
//             },
//           ),
//         ).copyWith(
//           secondary: secondaryColor,
//         ),
//         scaffoldBackgroundColor: Colors.white,
//         fontFamily: 'Roboto',
//         textTheme: TextTheme(
//           displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: primaryColor),
//           titleLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: primaryColor),
//           bodyMedium: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
//         ),
//         appBarTheme: AppBarTheme(
//           backgroundColor: primaryColor,
//           titleTextStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
//           iconTheme: IconThemeData(color: Colors.white),
//         ),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: primaryColor,
//             foregroundColor: Colors.white,
//             textStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12.0),
//             ),
//           ),
//         ),
//         inputDecorationTheme: InputDecorationTheme(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12.0),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: primaryColor),
//             borderRadius: BorderRadius.circular(12.0),
//           ),
//           labelStyle: TextStyle(color: primaryColor),
//         ),
//       ),
//       home: SplashScreen(), // Use SplashScreen as the initial page
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'login_page.dart';
// import 'main_page.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   final Color primaryColor = Color.fromARGB(255, 27, 23, 84);
//   final Color secondaryColor = Colors.orangeAccent;

//   Future<Widget> _getInitialPage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
//     return isLoggedIn ? MainPage() : LoginPage();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Vaayusastra',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSwatch(
//           primarySwatch: MaterialColor(
//             primaryColor.value,
//             {
//               50: primaryColor.withOpacity(0.1),
//               100: primaryColor.withOpacity(0.2),
//               200: primaryColor.withOpacity(0.3),
//               300: primaryColor.withOpacity(0.4),
//               400: primaryColor.withOpacity(0.5),
//               500: primaryColor.withOpacity(0.6),
//               600: primaryColor.withOpacity(0.7),
//               700: primaryColor.withOpacity(0.8),
//               800: primaryColor.withOpacity(0.9),
//               900: primaryColor,
//             },
//           ),
//         ).copyWith(
//           secondary: secondaryColor,
//         ),
//         scaffoldBackgroundColor: Colors.white,
//         fontFamily: 'Roboto',
//         textTheme: TextTheme(
//           displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: primaryColor),
//           titleLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: primaryColor),
//           bodyMedium: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
//         ),
//         appBarTheme: AppBarTheme(
//           backgroundColor: primaryColor,
//           titleTextStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
//           iconTheme: IconThemeData(color: Colors.white),
//         ),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: primaryColor,
//             foregroundColor: Colors.white,
//             textStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12.0),
//             ),
//           ),
//         ),
//         inputDecorationTheme: InputDecorationTheme(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12.0),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: primaryColor),
//             borderRadius: BorderRadius.circular(12.0),
//           ),
//           labelStyle: TextStyle(color: primaryColor),
//         ),
//       ),
//       home: FutureBuilder<Widget>(
//         future: _getInitialPage(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else {
//             return snapshot.data!;
//           }
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'login_page.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   final Color primaryColor = Color.fromARGB(255, 27, 23, 84);
//   final Color secondaryColor = Colors.orangeAccent;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Vaayusastra',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSwatch(
//           primarySwatch: MaterialColor(
//             primaryColor.value,
//             {
//               50: primaryColor.withOpacity(0.1),
//               100: primaryColor.withOpacity(0.2),
//               200: primaryColor.withOpacity(0.3),
//               300: primaryColor.withOpacity(0.4),
//               400: primaryColor.withOpacity(0.5),
//               500: primaryColor.withOpacity(0.6),
//               600: primaryColor.withOpacity(0.7),
//               700: primaryColor.withOpacity(0.8),
//               800: primaryColor.withOpacity(0.9),
//               900: primaryColor,
//             },
//           ),
//         ).copyWith(
//           secondary: secondaryColor,
//         ),
//         scaffoldBackgroundColor: Colors.white,
//         fontFamily: 'Roboto',
//         textTheme: TextTheme(
//           displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: primaryColor),
//           titleLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: primaryColor),
//           bodyMedium: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
//         ),
//         appBarTheme: AppBarTheme(
//           backgroundColor: primaryColor,
//           titleTextStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
//           iconTheme: IconThemeData(color: Colors.white),
//         ),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: primaryColor,
//             foregroundColor: Colors.white,
//             textStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12.0),
//             ),
//           ),
//         ),
//         inputDecorationTheme: InputDecorationTheme(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12.0),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: primaryColor),
//             borderRadius: BorderRadius.circular(12.0),
//           ),
//           labelStyle: TextStyle(color: primaryColor),
//         ),
//       ),
//       home: LoginPage(),
//     );
//   }
// }















// //client id: 92298392814-61a9nn1gr208grjit2j0ved9mlo53b0f.apps.googleusercontent.com
// //client secret : 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