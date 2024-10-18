import 'package:ecommerce/Views/commponents/customTextForm.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _LoginPageState();
}
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
class _LoginPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFee9b9a),
      appBar: AppBar(
        backgroundColor: const Color(0xFFee9b9a),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sign UP",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 30,
                ),
                Text(
                    "Hey, Welcome to the app, here provide your email and password to Sign UP.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(70)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 55),
                  Form(
                     key: _formKey,
                      child: Column(
                    children: [
                      CustomTextField(
                        hintText: 'Email',
                        controller: _emailController,
                        isEmailField: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          const emailPattern =
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                          if (!RegExp(emailPattern).hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height:20),
                      CustomTextField(
                        hintText: 'Password',
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 380,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 0, color: Colors.black),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()==true)
                          {

                          }else
                            {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Invalid Data input")),
                              );
                            }
                      },
                      child: const Text("Sign Up",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  _buildSocailButton(
                      "images/SignUpPage/google.png", "Sign Up with google"),
                  const SizedBox(
                    height: 30,
                  ),
                  _buildSocailButton(
                      "images/SignUpPage/facebook.png", "Sign Up with Facebook"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSocailButton(String ImagePath, String ButtonName) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: 400,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
          border: Border.all(width: 0, color: Colors.white),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 7,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: TextButton(
          onPressed: () {},
          child: Row(children: [
            Image.asset(
              ImagePath,
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 50),
            Text(
              ButtonName,
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward,
              size: 30,
              color: Colors.black,
            ),
          ]),
        ));
  }
}
