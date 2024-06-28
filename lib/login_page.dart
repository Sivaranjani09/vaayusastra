// login_page.dart - physical dev

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'courses_page.dart';
import 'register_page.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
    clientId: '92298392814-61a9nn1gr208grjit2j0ved9mlo53b0f.apps.googleusercontent.com',
  );

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.post(
      Uri.parse('http://192.168.1.6:3000/login'), // Update IP address
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': _emailController.text,
        'password': _passwordController.text,
      }),
    );

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Login failed'),
      ));
    }
  }

  void _googleLogin() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return;
      }

      final response = await http.post(
        Uri.parse('http://192.168.1.6:3000/google-login'), // Update IP address
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': googleUser.email,
          'name': googleUser.displayName,
        }),
      );

      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', true);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Google Login failed'),
        ));
      }
    } catch (error) {
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Google Login failed'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Color.fromARGB(255, 27, 23, 84),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/splash.jpg', // Replace with your logo asset
                        height: 150,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 27, 23, 84)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 27, 23, 84)),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword ? Icons.visibility_off : Icons.visibility,
                              color: Color.fromARGB(255, 27, 23, 84),
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        obscureText: _obscurePassword,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _login,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
                          child: Text('Login'),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 27, 23, 84),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _googleLogin,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
                          child: Text('Login with Google'),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Color.fromARGB(255, 27, 23, 84)),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterPage()),
                          );
                        },
                        child: Text('Register Now'),
                        style: TextButton.styleFrom(foregroundColor: Color.fromARGB(255, 27, 23, 84)),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}










// // login_page.dart - chrome
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'courses_page.dart';
// import 'register_page.dart';
// import 'main_page.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;
//   bool _obscurePassword = true;

//   final GoogleSignIn _googleSignIn = GoogleSignIn(
//     scopes: ['email'],
//     clientId: '92298392814-61a9nn1gr208grjit2j0ved9mlo53b0f.apps.googleusercontent.com',
//   );

//   void _login() async {
//     setState(() {
//       _isLoading = true;
//     });

//     final response = await http.post(
//       Uri.parse('http://localhost:3000/login'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         'email': _emailController.text,
//         'password': _passwordController.text,
//       }),
//     );

//     setState(() {
//       _isLoading = false;
//     });

//     if (response.statusCode == 200) {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.setBool('isLoggedIn', true);

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => MainPage()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Login failed'),
//       ));
//     }
//   }

//   void _googleLogin() async {
//     try {
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       if (googleUser == null) {
//         return;
//       }

//       final response = await http.post(
//         Uri.parse('http://localhost:3000/google-login'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           'email': googleUser.email,
//           'name': googleUser.displayName,
//         }),
//       );

//       if (response.statusCode == 200) {
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         prefs.setBool('isLoggedIn', true);

//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => MainPage()),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Google Login failed'),
//         ));
//       }
//     } catch (error) {
//       print(error);
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Google Login failed'),
//       ));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//         backgroundColor: Color.fromARGB(255, 27, 23, 84),
//       ),
//       body: Center(
//         child: _isLoading
//             ? CircularProgressIndicator()
//             : Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         'assets/splash.jpg', // Replace with your logo asset
//                         height: 150,
//                       ),
//                       SizedBox(height: 20),
//                       TextField(
//                         controller: _emailController,
//                         decoration: InputDecoration(
//                           labelText: 'Email',
//                           prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 27, 23, 84)),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       TextField(
//                         controller: _passwordController,
//                         decoration: InputDecoration(
//                           labelText: 'Password',
//                           prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 27, 23, 84)),
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               _obscurePassword ? Icons.visibility_off : Icons.visibility,
//                               color: Color.fromARGB(255, 27, 23, 84),
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 _obscurePassword = !_obscurePassword;
//                               });
//                             },
//                           ),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         obscureText: _obscurePassword,
//                       ),
//                       SizedBox(height: 20),
//                       ElevatedButton(
//                         onPressed: _login,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
//                           child: Text('Login'),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color.fromARGB(255, 27, 23, 84),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       ElevatedButton(
//                         onPressed: _googleLogin,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
//                           child: Text('Login with Google'),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white,
//                           foregroundColor: Colors.black,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             side: BorderSide(color: Color.fromARGB(255, 27, 23, 84)),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => RegisterPage()),
//                           );
//                         },
//                         child: Text('Register Now'),
//                         style: TextButton.styleFrom(foregroundColor: Color.fromARGB(255, 27, 23, 84)),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//       ),
//     );
//   }
// }








// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'courses_page.dart';
// import 'register_page.dart';
// import 'main_page.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;
//   bool _obscurePassword = true;

//   final GoogleSignIn _googleSignIn = GoogleSignIn(
//     scopes: ['email'],
//     clientId: '92298392814-61a9nn1gr208grjit2j0ved9mlo53b0f.apps.googleusercontent.com',
//   );

//   Future<void> _login() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final response = await http.post(
//         Uri.parse('http://192.168.1.248:3000/login'),  // Replace with your backend server IP
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           'email': _emailController.text,
//           'password': _passwordController.text,
//         }),
//       );

//       setState(() {
//         _isLoading = false;
//       });

//       if (response.statusCode == 200) {
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         prefs.setBool('isLoggedIn', true);

//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => MainPage()),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Login failed'),
//         ));
//       }
//     } catch (error) {
//       setState(() {
//         _isLoading = false;
//       });
//       print('Login Error: $error');
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Login failed. Please check your credentials and try again.'),
//       ));
//     }
//   }

//   Future<void> _googleLogin() async {
//     try {
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       if (googleUser == null) {
//         return;
//       }

//       final response = await http.post(
//         Uri.parse('http://192.168.1.248:3000/google-login'),  // Replace with your backend server IP
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           'email': googleUser.email,
//           'name': googleUser.displayName,
//         }),
//       );

//       if (response.statusCode == 200) {
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         prefs.setBool('isLoggedIn', true);

//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => MainPage()),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Google Login failed'),
//         ));
//       }
//     } catch (error) {
//       print('Google Login Error: $error');
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Google Login failed'),
//       ));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//         backgroundColor: Color.fromARGB(255, 27, 23, 84),
//       ),
//       body: Center(
//         child: _isLoading
//             ? CircularProgressIndicator()
//             : Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         'assets/splash.jpg', // Replace with your logo asset
//                         height: 150,
//                       ),
//                       SizedBox(height: 20),
//                       TextField(
//                         controller: _emailController,
//                         decoration: InputDecoration(
//                           labelText: 'Email',
//                           prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 27, 23, 84)),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       TextField(
//                         controller: _passwordController,
//                         decoration: InputDecoration(
//                           labelText: 'Password',
//                           prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 27, 23, 84)),
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               _obscurePassword ? Icons.visibility_off : Icons.visibility,
//                               color: Color.fromARGB(255, 27, 23, 84),
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 _obscurePassword = !_obscurePassword;
//                               });
//                             },
//                           ),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         obscureText: _obscurePassword,
//                       ),
//                       SizedBox(height: 20),
//                       ElevatedButton(
//                         onPressed: _login,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
//                           child: Text('Login'),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color.fromARGB(255, 27, 23, 84),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       ElevatedButton(
//                         onPressed: _googleLogin,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
//                           child: Text('Login with Google'),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white,
//                           foregroundColor: Colors.black,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             side: BorderSide(color: Color.fromARGB(255, 27, 23, 84)),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => RegisterPage()),
//                           );
//                         },
//                         child: Text('Register Now'),
//                         style: TextButton.styleFrom(foregroundColor: Color.fromARGB(255, 27, 23, 84)),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//       ),
//     );
//   }
// }






// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'courses_page.dart';
// import 'register_page.dart';
// import 'main_page.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;

//   final GoogleSignIn _googleSignIn = GoogleSignIn(
//     scopes: ['email'],
//     clientId: '92298392814-61a9nn1gr208grjit2j0ved9mlo53b0f.apps.googleusercontent.com',
//   );

//   void _login() async {
//     setState(() {
//       _isLoading = true;
//     });

//     final response = await http.post(
//       Uri.parse('http://localhost:3000/login'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         'email': _emailController.text,
//         'password': _passwordController.text,
//       }),
//     );

//     setState(() {
//       _isLoading = false;
//     });

//     if (response.statusCode == 200) {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.setBool('isLoggedIn', true);

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => MainPage()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Login failed'),
//       ));
//     }
//   }

//   void _googleLogin() async {
//     try {
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       if (googleUser == null) {
//         return;
//       }

//       final response = await http.post(
//         Uri.parse('http://localhost:3000/google-login'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           'email': googleUser.email,
//           'name': googleUser.displayName,
//         }),
//       );

//       if (response.statusCode == 200) {
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         prefs.setBool('isLoggedIn', true);

//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => MainPage()),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Google Login failed'),
//         ));
//       }
//     } catch (error) {
//       print(error);
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Google Login failed'),
//       ));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Center(
//         child: _isLoading
//             ? CircularProgressIndicator()
//             : Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.lock, size: 100, color: Color.fromARGB(255, 27, 23, 84)),
//                     SizedBox(height: 20),
//                     TextField(
//                       controller: _emailController,
//                       decoration: InputDecoration(
//                         labelText: 'Email',
//                         prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 27, 23, 84)),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     TextField(
//                       controller: _passwordController,
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                         prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 27, 23, 84)),
//                       ),
//                       obscureText: true,
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: _login,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
//                         child: Text('Login'),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: _googleLogin,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
//                         child: Text('Login with Google'),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.white,
//                         foregroundColor: Colors.black,
//                         padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => RegisterPage()),
//                         );
//                       },
//                       child: Text('Register Now'),
//                       style: TextButton.styleFrom(foregroundColor: Color.fromARGB(255, 27, 23, 84)),
//                     ),
//                   ],
//                 ),
//               ),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'courses_page.dart';
// import 'register_page.dart';
// import 'main_page.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;

//   final GoogleSignIn _googleSignIn = GoogleSignIn(
//     scopes: ['email'],
//     clientId: '92298392814-61a9nn1gr208grjit2j0ved9mlo53b0f.apps.googleusercontent.com', // Replace with your actual Google Client ID
//   );

//   void _login() async {
//     setState(() {
//       _isLoading = true;
//     });

//     final response = await http.post(
//       Uri.parse('http://localhost:3000/login'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         'email': _emailController.text,
//         'password': _passwordController.text,
//       }),
//     );

//     setState(() {
//       _isLoading = false;
//     });

//     if (response.statusCode == 200) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => MainPage()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Login failed'),
//       ));
//     }
//   }

//   void _googleLogin() async {
//     try {
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       if (googleUser == null) {
//         // The user canceled the sign-in
//         return;
//       }

//       final response = await http.post(
//         Uri.parse('http://localhost:3000/google-login'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           'email': googleUser.email,
//           'name': googleUser.displayName,
//         }),
//       );

//       if (response.statusCode == 200) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => MainPage()),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Google Login failed'),
//         ));
//       }
//     } catch (error) {
//       print(error);
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Google Login failed'),
//       ));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Center(
//         child: _isLoading
//             ? CircularProgressIndicator()
//             : Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.lock, size: 100, color: Color.fromARGB(255, 27, 23, 84)),
//                     SizedBox(height: 20),
//                     TextField(
//                       controller: _emailController,
//                       decoration: InputDecoration(
//                         labelText: 'Email',
//                         prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 27, 23, 84)),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     TextField(
//                       controller: _passwordController,
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                         prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 27, 23, 84)),
//                       ),
//                       obscureText: true,
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: _login,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
//                         child: Text('Login'),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: _googleLogin,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
//                         child: Text('Login with Google'),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.white,
//                         foregroundColor: Colors.black,
//                         padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => RegisterPage()),
//                         );
//                       },
//                       child: Text('Register Now'),
//                       style: TextButton.styleFrom(foregroundColor: Color.fromARGB(255, 27, 23, 84)),
//                     ),
//                   ],
//                 ),
//               ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'courses_page.dart';
// import 'register_page.dart';
// import 'main_page.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;

//   void _login() async {
//     setState(() {
//       _isLoading = true;
//     });

//     final response = await http.post(
//       Uri.parse('http://localhost:3000/login'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         'email': _emailController.text,
//         'password': _passwordController.text,
//       }),
//     );

//     setState(() {
//       _isLoading = false;
//     });

//     if (response.statusCode == 200) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => MainPage()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Login failed'),
//       ));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Center(
//         child: _isLoading
//             ? CircularProgressIndicator()
//             : Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.lock, size: 100, color: Color.fromARGB(255, 27, 23, 84)),
//                     SizedBox(height: 20),
//                     TextField(
//                       controller: _emailController,
//                       decoration: InputDecoration(
//                         labelText: 'Email',
//                         prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 27, 23, 84)),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     TextField(
//                       controller: _passwordController,
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                         prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 27, 23, 84)),
//                       ),
//                       obscureText: true,
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: _login,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
//                         child: Text('Login'),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => RegisterPage()),
//                         );
//                       },
//                       child: Text('Register Now'),
//                       style: TextButton.styleFrom(foregroundColor: Color.fromARGB(255, 27, 23, 84)),
//                     ),
//                   ],
//                 ),
//               ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'courses_page.dart';
// import 'register_page.dart';
// import 'main_page.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;

//   void _login() async {
//     setState(() {
//       _isLoading = true;
//     });

//     final response = await http.post(
//       Uri.parse('http://localhost:3000/login'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         'email': _emailController.text,
//         'password': _passwordController.text,
//       }),
//     );

//     setState(() {
//       _isLoading = false;
//     });

//     if (response.statusCode == 200) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => MainPage()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Login failed'),
//       ));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Center(
//         child: _isLoading
//             ? CircularProgressIndicator()
//             : Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextField(
//                       controller: _emailController,
//                       decoration: InputDecoration(labelText: 'Email'),
//                     ),
//                     TextField(
//                       controller: _passwordController,
//                       decoration: InputDecoration(labelText: 'Password'),
//                       obscureText: true,
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: _login,
//                       child: Text('Login'),
//                     ),
//                     SizedBox(height: 20),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => RegisterPage()),
//                         );
//                       },
//                       child: Text('Register Now'),
//                     ),
//                   ],
//                 ),
//               ),
//       ),
//     );
//   }
// }

