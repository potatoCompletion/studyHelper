import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // background Color setup
      backgroundColor: Colors.grey[850],

      // Scaffold element -> appBar
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17.0,
          ),
        ),
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
    );
  }
}
