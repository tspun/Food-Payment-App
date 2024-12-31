import 'package:flutter/material.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, this.title});

  final String? title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background Image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/delicious3.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Signup Form Content
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.2),
                  _buildTitle(),
                  const SizedBox(height: 50),
                  _buildForm(),
                  const SizedBox(height: 20),
                  _buildRegisterButton(context),
                  const SizedBox(height: 30),
                  _buildLoginOption(context),
                ],
              ),
            ),
            Positioned(top: 40, left: 0, child: _buildBackButton(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        text: 'Sign ',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w700, color: Colors.blue),
        children: [
          TextSpan(
            text: 'Up ',
            style: TextStyle(color: Colors.purple, fontSize: 30),
          ),
          TextSpan(
            text: 'To ',
            style: TextStyle(color: Colors.teal, fontSize: 30),
          ),
          TextSpan(
            text: 'Food ',
            style: TextStyle(color: Colors.red, fontSize: 30),
          ),
          TextSpan(
            text: 'Payment App',
            style: TextStyle(color: Colors.lightBlue, fontSize: 30),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        _buildTextField(
            'User Name', 'Enter your username', Icons.person, false),
        _buildTextField('Email', 'Enter your email', Icons.email, false),
        _buildTextField('Password', 'Enter your password', Icons.lock, true),
        _buildTextField(
            'Confirm Password', 'Re-enter your password', Icons.lock, true),
      ],
    );
  }

  Widget _buildTextField(
      String label, String hint, IconData icon, bool isObscure) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 10),
          TextField(
            obscureText: isObscure,
            decoration: InputDecoration(
              hintText: hint,
              suffixIcon: Icon(icon),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You have registered successfully!')),
        );

        // Navigate to login page after a short delay
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [Colors.blue, Colors.lightBlue],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: const Text(
          'Register Now',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildLoginOption(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
      child: const Text.rich(
        TextSpan(
          text: "Already have an account? ",
          style: TextStyle(fontSize: 14),
          children: [
            TextSpan(
              text: "Login",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: const Row(
        children: [
          Icon(Icons.arrow_back, color: Colors.white),
          SizedBox(width: 5),
          Text(
            'Back',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
