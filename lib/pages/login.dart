import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../services/auth_provider.dart';

class Login extends StatefulWidget {
  final Function(String) updatePage;
  const Login({super.key, required this.updatePage});

  @override
  State<StatefulWidget> createState() => LoginWidget();
}

class LoginWidget extends State<Login> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> loginUser() async {
    try {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState?.save();

        String username = _usernameController.text;
        String password = _passwordController.text;
        Object obj = {'email': username, 'password': password};
        final response = await http.post(
            Uri.parse('http://localhost:4004/api/auth/login'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode(obj));
        if (response.statusCode == 200) {
          if (json.decode(response.body)['result']) {
            final authProvider =
                Provider.of<AuthProvider>(context, listen: false);
            authProvider.updateLoginStatus(true);
            Fluttertoast.showToast(
                msg: json.decode(response.body)['message'],
                gravity: ToastGravity.TOP,
                backgroundColor: Colors.green[700],
                textColor: Colors.white);
            Navigator.pushNamed(context, '/');
            return;
          }
        }
        Fluttertoast.showToast(
            msg: json.decode(response.body)['message'],
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.red[700],
            textColor: Colors.white);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.red[700],
          textColor: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              // padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const Center(
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    TextFormField(
                      controller: _usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username is required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(
                          color: Colors.grey[400],
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: _obscureText,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Colors.grey[400],
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          loginUser();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Align(
                      alignment: Alignment.topRight,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                        ),
                        child: const Text('Back to Home'),
                        onPressed: () {
                          widget.updatePage("dashboard");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
