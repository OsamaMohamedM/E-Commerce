import 'package:ecommerce/Views/Screens/LoginPage.dart';
import 'package:ecommerce/Views/Screens/SignUpPage.dart';
import 'package:flutter/material.dart';

class FirstLogin extends StatelessWidget {
  const FirstLogin({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 55),
            Image.asset(
              "images/beforeLogin/4.png",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.333333,
            ),
            const SizedBox(height: 50),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(70)),
                  color: const Color(0xFFee9b9a)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 90),
                    const Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      "Welcome to our Book Hub, where you can discover "
                          "and explore a vast collection of books from various genres. "
                          "Dive into your next great read, connect with fellow book lovers, "
                          "and track your reading journey.",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildButton(
                          text: "Login",
                          backgroundColor: const Color(0xFF212121),
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
                          },
                        ),
                        _buildButton(
                          text: "Sign Up",
                          backgroundColor: Colors.white,
                          textColor: Colors.black.withOpacity(0.8),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUpPage()));

                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: backgroundColor,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: textColor),
        ),
      ),
    );
  }
}
