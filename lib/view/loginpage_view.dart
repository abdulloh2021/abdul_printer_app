import 'package:abdul_printer_app/controller/auth_controller.dart';

import 'package:abdul_printer_app/view/printerspage_view.dart';
import 'package:abdul_printer_app/widget/custom_button.dart';
import 'package:abdul_printer_app/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginpageView extends StatefulWidget {
  @override
  _LoginpageViewState createState() => _LoginpageViewState();
}

class _LoginpageViewState extends State<LoginpageView> {
  final AuthController _authController =
      AuthController(); // Controller untuk login
  final TextEditingController _usernameController =
      TextEditingController(); // Untuk input username
  final TextEditingController _passwordController =
      TextEditingController(); // Untuk input password
  bool _isLoading = false; // Status loading tombol login

  // Fungsi untuk menangani login
  Future<void> _handleLogin() async {
    setState(() => _isLoading = true); // Tampilkan loading saat login

    // Panggil controller untuk login
    final response = await _authController.login(
      _usernameController.text.trim(), // Username dari input
      _passwordController.text.trim(), // Password dari input
    );

    setState(() => _isLoading = false); // Sembunyikan loading

    if (response['success']) {
      // Jika login berhasil, arahkan ke halaman Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PrinterspageView()),
      );
    } else {
      // Jika login gagal, tampilkan pesan error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response['message'] ?? 'Login failed.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/personal_project_logo.png",
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Manage your printer",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Color(0xffA7A8B3)),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Username",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextfield(
                    controller: _usernameController,
                    hintText: "Write your username",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextfield(
                    controller: _passwordController,
                    hintText: "Write your password",
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
              Column(
                children: [
                  Center(
                    child: // Tampilkan loading saat login
                        CustomButton(
                      isPrimary: true,
                      text: "Login",
                      onPressed: _handleLogin,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: CustomButton(
                        isPrimary: false,
                        text: "Example Login",
                        onPressed: () {
                          _showListUserPopup(context);
                        }),
                  ),

                  SizedBox(height: 20),
                  // // Tombol login atau indikator loading
                  // _isLoading
                  //     ? CircularProgressIndicator() // Tampilkan loading saat login
                  //     : ElevatedButton(
                  //         onPressed:
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  void _showListUserPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('List User '),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("https://dummyjson.com/users"),
              SizedBox(
                height: 10,
              ),
              Text("Username : jamesd"),
              Text("Password : jamesdpass"),
              SizedBox(
                height: 10,
              ),
              Text("Username : emilys"),
              Text("Password : emilyspass"),
              SizedBox(
                height: 10,
              ),
              Text("Username : sophiab"),
              Text("Password : sophiabpass"),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
