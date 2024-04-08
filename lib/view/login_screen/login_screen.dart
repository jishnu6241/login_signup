import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/view/register_screen.dart/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Login",
            style: GoogleFonts.courgette(fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
                hintText: 'Email', border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            obscureText: true,
            controller: passController,
            decoration: const InputDecoration(
                hintText: 'Password', border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text("Login"),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ));
            },
            child: const Text(
              "Don't Have an account? Create new",
              style: TextStyle(color: Colors.blue),
            ),
          )
        ]),
      ),
    ));
  }
}
