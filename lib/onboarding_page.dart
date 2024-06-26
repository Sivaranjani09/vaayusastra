import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: <Widget>[
          _buildPage(
            title: "Welcome to Vaayusastra",
            description: "Explore the wonders of science with hands-on activities and mythological sci-fi stories.",
            imagePath: "assets/splash.jpg",
          ),
          _buildPage(
            title: "Discover Courses",
            description: "Advance your skills with hands-on training and internships in aeronautics and aerospace..",
            imagePath: "assets/splash.jpg",
          ),
          _buildPage(
            title: "Get Started",
            description: "Join Vaayusastra and let your imagination soar!.",
            imagePath: "assets/splash.jpg",
          ),
        ],
      ),
      bottomSheet: _currentPage == 2
          ? TextButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('onboardingComplete', true);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text("Get Started"),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => _pageController.jumpToPage(2),
                    child: Text("Skip"),
                  ),
                  Row(
                    children: List.generate(3, (index) => _buildDot(index: index)),
                  ),
                  TextButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    child: Text("Next"),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildPage({required String title, required String description, required String imagePath}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imagePath),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDot({required int index}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      width: _currentPage == index ? 12.0 : 8.0,
      height: _currentPage == index ? 12.0 : 8.0,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}
