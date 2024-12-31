import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'signup_page.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            height: height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/delicious.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: height * .2),
                        _buildHeading(),
                        const SizedBox(height: 20),
                        _buildEmailField(),
                        _buildPasswordField(),
                        const SizedBox(height: 20),
                        _buildLoginButton(context),
                        _buildForgotPasswordLink(context),
                        _buildSignUpLink(context),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 0,
                  child: _buildBackButton(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeading() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        text: 'Welcome ',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w700, color: Colors.red),
        children: [
          TextSpan(
            text: 'to ',
            style: TextStyle(color: Color(0xFF0A74DA), fontSize: 30),
          ),
          TextSpan(
            text: 'Food',
            style: TextStyle(color: Color(0xFF0288D1), fontSize: 30),
          ),
          TextSpan(
            text: ' Payment App',
            style: TextStyle(color: Color(0xFF0A74DA), fontSize: 30),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: _emailController,
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Enter your email',
          suffixIcon: const Icon(Icons.email, color: Colors.black54),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          fillColor: const Color(0xfff3f3f4),
          filled: true,
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Enter your password',
          suffixIcon: const Icon(Icons.visibility, color: Colors.black54),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          fillColor: const Color(0xfff3f3f4),
          filled: true,
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [Color(0xFF0288D1), Color(0xFF0A74DA)],
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        },
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordLink(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
        );
      },
      child: const Text(
        'Forgot Password?',
        style: TextStyle(fontSize: 14, color: Colors.red),
      ),
    );
  }

  Widget _buildSignUpLink(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignUpPage()),
        );
      },
      child: const Text(
        'Don\'t have an account? Register',
        style: TextStyle(fontSize: 13, color: Colors.white),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: const Icon(Icons.keyboard_arrow_left, color: Colors.black),
    );
  }
}
