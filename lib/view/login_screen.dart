import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Log in or sign up",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(color: Colors.black12),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome to airbnb",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    //for the phone number field
                    phoneNumberField(size),
                    const SizedBox(height: 10),
                    RichText(
                      text: const TextSpan(
                        text:
                            "inim veniam,Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                        children: [
                          TextSpan(
                            text: "Privacy policy",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Container(
                      width: size.width,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.pink,
                      ),
                      child: const Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      children: [
                        Expanded(
                          child: Container(height: 1, color: Colors.black),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("or", style: TextStyle(fontSize: 18)),
                        ),
                        Expanded(
                          child: Container(height: 1, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.02),
                    socialIcons(
                      size,
                      Icons.facebook,
                      "Continue with Facebook",
                      Colors.blue,
                      30,
                    ),
                    socialIcons(
                      size,
                      Icons.apple,
                      "Continue with Apple",
                      Colors.black,
                      30,
                    ),
                    socialIcons(
                      size,
                      FontAwesomeIcons.google,
                      "Continue with Google",
                      Colors.red,
                      30,
                    ),
                    socialIcons(
                      size,
                      Icons.email,
                      "Continue with Email",
                      Colors.black,
                      30,
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        "Need help ?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding socialIcons(Size size, icon, name, color, double sizeIcon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),

      child: Container(
        width: size.width,
        padding: const EdgeInsets.symmetric(vertical: 11),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(),
        ),
        child: Row(
          children: [
            SizedBox(width: size.width * 0.05),
            Icon(icon, color: color, size: sizeIcon),
            SizedBox(width: size.width * 0.18),
            Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }

  Container phoneNumberField(Size size) {
    return Container(
      width: size.width,
      height: 130,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10, left: 10, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Country region", style: TextStyle(color: Colors.black45)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nepal (+345)",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Icon(Icons.keyboard_arrow_down_sharp, size: 30),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Phone number",
                hintStyle: TextStyle(fontSize: 18, color: Colors.black45),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
