import 'package:ecommerce/Views/Screens/FirstLogin.dart';
import 'package:ecommerce/Views/commponents/Indecator.dart';
import 'package:ecommerce/Views/commponents/pageViewScreen.dart';
import 'package:flutter/material.dart';

class onBoardScreen extends StatefulWidget {
  onBoardScreen({super.key});

  @override
  State<onBoardScreen> createState() => _onBoardScreenState();
}

class _onBoardScreenState extends State<onBoardScreen> {
  int index = 0;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>(FirstLogin())));
            },
            child: const Text(
              "Skip",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  onPageChanged: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  controller: _controller,
                  children: const [
                    pageViewScreen(
                      title: 'Order Your Food',
                      imagePath: 'images/beforeLogin/1.png',
                      content:
                      'Now you can order food any time right from your mobile.',
                    ),
                    pageViewScreen(
                      title: 'Cooking Safe Food',
                      imagePath: 'images/beforeLogin/2.png',
                      content:
                      'We maintain safety and keep clean while making food.',
                    ),
                    pageViewScreen(
                      title: 'Quick delivery',
                      imagePath: 'images/beforeLogin/3.png',
                      content:
                      'Orders of your favourite meals will be immediately delivered.',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(
                        3,
                            (i) => Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: customIndecator(active: index == i),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (index < 2) {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>(const FirstLogin())));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.all(16),
                      ),
                      child: const Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16), // Space at the bottom if needed
            ],
          ),
        ),
      ),
    );
  }
}
