import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
              child: Image(
                  image: NetworkImage(
                      'https://clipground.com/images/loading-logo-clipart-5.png')),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Splash Screen",
              style: GoogleFonts.courgette(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
