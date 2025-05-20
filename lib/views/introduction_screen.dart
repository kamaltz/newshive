import 'package:flutter/material.dart';
import 'package:praktikum_mobile/views/auth/login_screen.dart';

class Introductionscreen extends StatefulWidget {
  const Introductionscreen({super.key});

  @override
  State<Introductionscreen> createState() => _IntroductionscreenState();
}

class _IntroductionscreenState extends State<Introductionscreen> {
  int _currentPage = 0;

  final List<Map<String, String>> introData = [
    {
      "image": "assets/images/img1.png",
      "title": "The World at Your Fingertipss",
      "desc":
          "Get 24/7 updates on global news – from breaking politics to cultural trends, all in one place",
    },
    {
      "image": "assets/images/img2.png",
      "title": "Stay Informed Instantly",
      "desc": "Never miss a beat. Real-time news alerts tailored just for you.",
    },
    {
      "image": "assets/images/img3.png",
      "title": "Anywhere, Anytime",
      "desc":
          "Your trusted news companion — whether you're commuting, working, or relaxing at home.",
    },
  ];

  void _nextPage() {
    if (_currentPage < introData.length - 1) {
      setState(() => _currentPage++);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Loginscreen()),
      );
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      setState(() => _currentPage--);
    }
  }

  Widget _buildDotIndicator(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: _currentPage == index ? 14 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Color(0xFF2D336B) : Colors.grey[400],
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final item = introData[_currentPage];
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(40),
              child: Column(
                children: [
                  Image.asset(item['image']!, width: 300),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item['title']!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item['desc']!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      introData.length,
                      _buildDotIndicator,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  if (_currentPage < 2)
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _prevPage,
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Color(0xFF2D336B),
                          ),
                          minimumSize: WidgetStateProperty.all(
                            Size(double.infinity, 60),
                          ),
                        ),
                        label: Text(
                          "Back",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  if (_currentPage > 0) SizedBox(width: 10),
                  if (_currentPage > 0 || _currentPage == 0)
                    SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _nextPage,
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Color(0xFF2D336B),
                        ),
                        minimumSize: WidgetStateProperty.all(
                          Size(double.infinity, 60),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _currentPage == introData.length - 1
                                ? "Get Started"
                                : "Next",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            _currentPage == introData.length - 1
                                ? Icons.check
                                : Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
