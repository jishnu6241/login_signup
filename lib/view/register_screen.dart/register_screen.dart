import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/view/login_screen/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Register",
            style: GoogleFonts.courgette(fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
                hintText: 'Email', border: OutlineInputBorder()),
            validator: (value) {
              if (RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(emailController.text)) {
                return null;
              } else {
                return "enter a valid email";
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            obscureText: true,
            controller: passController,
            decoration: const InputDecoration(
                hintText: 'Password', border: OutlineInputBorder()),
            validator: (value) {
              if (value != null) {
                return null;
              } else {
                return "Enter a valid password";
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () async {
                  try {
                    if (formKey.currentState!.validate()) {
                      final cred = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passController.text);
                      if (cred.user?.uid != null) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Failed to create account ,Try again")));
                      }
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('The password provided is too weak.')));
                    } else if (e.code == 'email-already-in-use') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              'The account already exists for that email.')));
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Text("Register"),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
              onTap: () {},
              child: const Text(
                "Already Have Account? Log-In",
                style: TextStyle(color: Colors.blue),
              ))
        ]),
      ),
    ));
  }
}
