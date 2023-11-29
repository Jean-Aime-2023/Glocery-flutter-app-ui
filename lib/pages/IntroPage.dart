import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'HomePage.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 80.0, right: 80.0, bottom: 40.0, top: 160.0),
            child: Image.asset('lib/images/avocado.png'),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "We deliver at your doorstep!!",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              )
            ),
          ),

          const SizedBox(height:24),

 
          Text("Fresh item everyday",
          style: TextStyle(color: Colors.grey[600]),
          ),

          const Spacer(),

          GestureDetector(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder:(context){return const HomePage();})),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(24),
              child: const Text(
                "Get Started",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          const Spacer(),

        ],
      ),
    );
  }
}
