import 'package:app/Auth/login_screen.dart';
import 'package:flutter/material.dart';

import '../components/textField.dart';

class SignUpScreen extends StatefulWidget {
  final Function()? onTap;
  const SignUpScreen({super.key, this.onTap});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();

  final userNameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary, // Uses primary color
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Please register with email and sign up to continue using our app",
                style: TextStyle(color: Theme.of(context).colorScheme.primary), // Uses onSecondary for subtle text
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              // Social Media Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.surface, // Uses surface color from theme
                    child: Icon(Icons.facebook, color: Colors.blue),
                  ),
                  SizedBox(width: 15),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.surface, // Uses surface color from theme
                    child: Icon(Icons.linked_camera, color: Colors.blue),
                  ),
                  SizedBox(width: 15),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.surface, // Uses surface color from theme
                    child: Icon(Icons.apple, color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "or sign up with email",
                style: TextStyle(color: Theme.of(context).colorScheme.primary), // Uses onSecondary
              ),
              SizedBox(height: 20),
              // Full Name Field
              MyTextField(controller: nameController, text: 'FullName', obscureText: false),
              SizedBox(height: 20),
              // User Name Field
              MyTextField(controller: userNameController, text: 'UserName', obscureText: false),
              SizedBox(height: 20),
              // Email Field
              MyTextField(controller: emailController, text: 'Email', obscureText: false),
              SizedBox(height: 20),
              // Phone number Field
              MyTextField(controller: phoneController, text: 'Phone number', obscureText: false),
              SizedBox(height: 20),
              // Password Field
              MyTextField(controller: passwordController, text: 'Password', obscureText: true),
              SizedBox(height: 20),
              // Confirm Password Field
              MyTextField(controller: confirmPasswordController, text: 'Confirm Password', obscureText: true),
              SizedBox(height: 10),
              // Terms and Conditions
              Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  Expanded(
                    child: Text(
                      "I agree with the terms of service and privacy policy",
                      style: TextStyle(color: Theme.of(context).colorScheme.primary), // Uses onSecondary
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Sign Up Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary, // Uses primary color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text("Sign Up", style: TextStyle(color: Theme.of(context).colorScheme.secondary)), // Uses secondary (white)
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Theme.of(context).colorScheme.primary), // Uses primary color
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary, // Uses primary color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
