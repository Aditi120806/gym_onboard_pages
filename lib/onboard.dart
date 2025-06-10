import 'package:flutter/material.dart';
import 'package:flutter_application_1/heightscreen.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
       body: Stack(
        children: [
       
          Positioned.fill(
            child: Image.asset(
              'assets/new.jpg',
              fit: BoxFit.cover, 
            ),
          ),
          Positioned(
            top: 220 ,
            left: 115,
            child:Text("FitStart",style: GoogleFonts.poppins(fontSize:43,fontWeight: FontWeight.w800,color: Colors.white),) 
          ),
         
          
          Positioned(
           top: screenHeight * 0.90,
            bottom: 20,
            left: 20,
            right: 20,
            child: GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                 color:  Color(0xFFBFFF00),
                 borderRadius: BorderRadius.circular(20)

                ),
                
                child: Row(
                  children: [
                    SizedBox(width: 90),
                    Text("Get Started",style: GoogleFonts.poppins(fontSize: 23,fontWeight: FontWeight.w600),),
                    SizedBox(width: 10,),
                    Icon(Icons.chevron_right,color: Colors.black,size: 30,)
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Heightscreen()));
              },
            ))
        ],
      ),
    );
  }
}