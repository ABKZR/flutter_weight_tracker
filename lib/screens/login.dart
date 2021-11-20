import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weight_tracker/screens/home_page.dart';
import 'package:flutter_weight_tracker/screens/signup.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController _textController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          textField('Username', false, _textController),
          textField('Password', true, _passwordController),
          Container(
              height: 40,
              width: 200,
              child: ElevatedButton(
                  onPressed: () async {
                    await _firebaseAuth
                        .signInWithEmailAndPassword(
                            email: _textController.text,
                            password: _passwordController.text)
                        .then((value) => {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => HomePage()))
                            })
                        .catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              'Error: Please enter correct email and password')));
                    });
                  },
                  child: Text('Login'))),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => SignupScreen()));
              },
              child: Text('Don\'t have accout? Signup'))
        ],
      ),
    );
  }

  Center textField(
      String hint, bool obscure, TextEditingController controller) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        height: 50,
        width: 300,
        child: TextField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black26),
            ),
          ),
        ),
      ),
    );
  }
}
