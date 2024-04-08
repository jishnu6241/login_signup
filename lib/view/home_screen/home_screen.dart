import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "HomeScreen",
              style: GoogleFonts.courgette(fontSize: 22),
            ),
          ),
          body: const TabBar(tabs: [
            Tab(
              text: 'User',
            ),
            Tab(
              text: 'Admin',
            )
          ]),
        ),
      ),
    );
  }
}
