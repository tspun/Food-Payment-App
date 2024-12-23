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
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/delicious.jpg'), // Background image
              fit: BoxFit.cover, // To cover the whole screen
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
                      // Heading with updated color
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          text: 'Welcome ',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 247, 1, 1), // Red Color
                          ),
                          children: [
                            TextSpan(
                              text: 'to ',
                              style: TextStyle(
                                color: Color(0xFF0A74DA), // Lighter blue
                                fontSize: 30,
                              ),
                            ),
                            TextSpan(
                              text: 'Food',
                              style: TextStyle(
                                color: Color(0xFF0288D1), // Sky blue color
                                fontSize: 30,
                              ),
                            ),
                            TextSpan(
                              text: ' Payment App',
                              style: TextStyle(
                                color: Color(0xFF0A74DA), // Lighter blue
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 80,
                          ),
                          // Email input field
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  "Email",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.start,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: "email",
                                    suffixIcon: const Icon(
                                      Icons.email,
                                      color: Colors.black54,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    fillColor: const Color(0xfff3f3f4),
                                    filled: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Password input field
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  "Password",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "password",
                                    suffixIcon: const Icon(
                                      Icons.visibility,
                                      color: Colors.black54,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    fillColor: const Color(0xfff3f3f4),
                                    filled: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Login button with updated color
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey.shade200,
                                offset: const Offset(2, 4),
                                blurRadius: 5,
                                spreadRadius: 2),
                          ],
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFF0288D1), // Light blue for the gradient
                              Color(0xFF0A74DA), // Slightly darker blue
                            ],
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Home(),
                              ),
                            );
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      // Forgot password link
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Forgot Password ?',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF0288D1), // Blue color for links
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Sign-up link
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpPage(),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          padding: const EdgeInsets.all(15),
                          alignment: Alignment.bottomCenter,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Don\'t have an account ?',
                                style: TextStyle(
                                  color: Color.fromARGB(
                                      255, 247, 73, 4), // Red color
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Register',
                                style: TextStyle(
                                  color: Color(0xFF0288D1), // Blue link color
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 0,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(
                            left: 0,
                            top: 10,
                            bottom: 10,
                          ),
                          child: const Icon(
                            Icons.keyboard_arrow_left,
                            color: Colors.black,
                          ),
                        ),
                        // const Text(
                        //   'Back',
                        //   style: TextStyle(
                        //     fontSize: 15,
                        //     fontWeight: FontWeight.w500,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
