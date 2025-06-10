import 'package:flutter/material.dart';
import 'package:flutter_application_1/agescreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(const MaterialApp(home: Weightscreen()));
}

class Weightscreen extends StatefulWidget {
  const Weightscreen({Key? key}) : super(key: key);

  @override
  State<Weightscreen> createState() => _WeightInputPageState();
}

class _WeightInputPageState extends State<Weightscreen> {
  double _currentWeight = 60;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          
         Positioned.fill(
            child: Image.asset(
              'assets/fit2.jpg', 
              fit: BoxFit.cover,
            ),
          ),
           Positioned(
            top: 60,
            left: 80,
            child: Text("Add Your Weight",style: GoogleFonts.poppins(fontSize: 28,color:Color(0xFFBFFF00)),),),

        
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                

              
                Text(
                  '${_currentWeight.toInt()} kg',
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFBFFF00),
                  ),
                ),
                const SizedBox(height: 10),

              
                SizedBox(
                  height: 300,
                  child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        startAngle: 180,
                        endAngle: 0,
                        minimum: 0,
                        maximum: 150,
                        interval: 10,
                        showLabels: true,
                        showTicks: true,
                        axisLineStyle: const AxisLineStyle(
                          thickness: 15,
                          color: Colors.white30,
                          thicknessUnit: GaugeSizeUnit.logicalPixel,
                        ),
                        majorTickStyle: const MajorTickStyle(
                          length: 8,
                          thickness: 1,
                          color: Colors.white70,
                        ),
                        minorTickStyle: const MinorTickStyle(
                          length: 4,
                          thickness: 1,
                          color: Colors.white38,
                        ),
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                            angle: 90,
                            positionFactor: 0.1,
                            widget: const Text(
                              'Adjust Your Weight',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                        pointers: <GaugePointer>[
                          NeedlePointer(
                            value: _currentWeight,
                            needleColor: const Color(0xFFBFFF00),
                            needleLength: 0.7,
                            knobStyle: const KnobStyle(
                              color: Colors.white,
                              knobRadius: 0.05,
                            ),
                            enableDragging: true,
                            onValueChanged: (value) {
                              setState(() {
                                _currentWeight = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //const SizedBox(height: 20),
              ],
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
