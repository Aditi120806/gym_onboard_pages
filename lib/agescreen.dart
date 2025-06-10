import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MaterialApp(home: AgeInputScreen()));

class AgeInputScreen extends StatefulWidget {
  const AgeInputScreen({Key? key}) : super(key: key);

  @override
  State<AgeInputScreen> createState() => _AgeInputScreenState();
}

class _AgeInputScreenState extends State<AgeInputScreen> {
  int _age = 25; 

  @override
  Widget build(BuildContext context) {
   final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
    
      body: Stack(
        children: [
      
          Positioned.fill(
            child: Image.asset(
              'assets/fit2.jpg', 
              fit: BoxFit.cover,
            ),
          ), Positioned(
            top: 60,
            left: 100,
            child: Text("Add Your Age",style: GoogleFonts.poppins(fontSize: 28,color:Color(0xFFBFFF00)),),),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                 
                  const SizedBox(height: 40),
                  
                
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.6),
                      border: Border.all(
                        color: const Color(0xFFBFFF00), 
                        width: 8,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "$_age",
                        style: const TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, 
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (_age > 1) _age--;
                          });
                        },
                        icon: const Icon(Icons.remove_circle),
                        iconSize: 50,
                        color: const Color(0xFFBFFF00),
                      ),
                      const SizedBox(width: 40),
                    
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (_age < 100) _age++;
                          });
                        },
                        icon: const Icon(Icons.add_circle),
                        iconSize: 50,
                        color: const Color(0xFFBFFF00),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
          
            left: 0,
            right: 0,
            child:Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>AgeInputScreen()));
                },
                child: Container(
                  height: screenWidth * 0.12,
                  width: screenWidth *0.80,
                    decoration: BoxDecoration(
                    color:Color(0xFFBFFF00),
                    borderRadius: BorderRadius.circular(25)
                  ),
                   child: Center(
                     child: Text(
                       'Continue',
                       style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.black),
                                      ),
                   ),
                ),
              ),
            )),
        ],
      ),
    );
  }
}
