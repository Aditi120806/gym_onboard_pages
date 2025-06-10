import 'package:flutter/material.dart';
import 'package:flutter_application_1/weightscrenn.dart';
import 'package:google_fonts/google_fonts.dart';


class Heightscreen extends StatefulWidget {
  const Heightscreen({Key? key}) : super(key: key);

  @override
  _RulerScaleScreenState createState() => _RulerScaleScreenState();
}

class _RulerScaleScreenState extends State<Heightscreen> {
 
  double _heightCm = 150;

 
  final double rulerHeightPx = 400;
  final int minHeightCm = 100;
  final int maxHeightCm = 200;

  double heightToPosition(double cm) {
    final int range = maxHeightCm - minHeightCm;
    return rulerHeightPx * (1 - (cm - minHeightCm) / range);
  }

 
  double positionToHeight(double pos) {
    final int range = maxHeightCm - minHeightCm;
    double ratio = 1 - (pos / rulerHeightPx);
    double cm = minHeightCm + ratio * range;
    if (cm < minHeightCm) cm = minHeightCm.toDouble();
    if (cm > maxHeightCm) cm = maxHeightCm.toDouble();
    return cm;
  }

  late double dragPosition;

  @override
  void initState() {
    super.initState();
    dragPosition = heightToPosition(_heightCm);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          
         
          Positioned.fill(
            child: 
            Image.asset("assets/fit2.jpg",fit: BoxFit.cover,
            
            ),
            
          ),
          Positioned(
            top: 60,
            left: 80,
            child: Text("Add Your Height",style: GoogleFonts.poppins(fontSize: 28,color:Color(0xFFBFFF00)),),),

          Positioned(
            bottom: screenHeight * 0.12,
            left: screenWidth * 0.26,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${_heightCm.toStringAsFixed(1)} cm',
                style: const TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
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
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Weightscreen()));
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

         
          Positioned(
            right: 16,
            top: (screenHeight - rulerHeightPx) / 2,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                setState(() {
                  dragPosition += details.delta.dy;
                  if (dragPosition < 0) dragPosition = 0;
                  if (dragPosition > rulerHeightPx) dragPosition = rulerHeightPx;
                  _heightCm = positionToHeight(dragPosition);
                });
              },
              child: CustomPaint(
                size: Size(60, rulerHeightPx),
                painter: RulerPainter(
                  position: dragPosition,
                  minHeight: minHeightCm,
                  maxHeight: maxHeightCm,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RulerPainter extends CustomPainter {
  final double position;
  final int minHeight;
  final int maxHeight;

  RulerPainter({
    required this.position,
    required this.minHeight,
    required this.maxHeight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.white;
    final double width = size.width;
    final double height = size.height;

    final double majorTickLength = width * 0.2;
    final double minorTickLength = width * 0.1;


    final rect = Rect.fromLTWH(0, 0, width, height);
    final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(8));
    final backgroundPaint = Paint()..color = Colors.black.withOpacity(0.3);
    canvas.drawRRect(rrect, backgroundPaint);

    int totalCm = maxHeight - minHeight;

    double pixelsPerCm = height / totalCm;

    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

   
    for (int i = 0; i <= totalCm; i++) {
      double y = i * pixelsPerCm;

      bool isMajorTick = (i % 5 == 0);

      double tickLength = isMajorTick ? majorTickLength : minorTickLength;

      paint.strokeWidth = isMajorTick ? 2 : 1;

     
      canvas.drawLine(Offset(width, y), Offset(width - tickLength, y), paint);

      if (isMajorTick) {
        final textSpan = TextSpan(
          text: '${minHeight + (totalCm - i)}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 8,
          ),
        );
        textPainter.text = textSpan;
        textPainter.layout();
        textPainter.paint(canvas, Offset(width - tickLength - 28, y - 8));
      }
    }

    final indicatorPaint = Paint()
      ..color =  Color(0xFFBFFF00)
      ..strokeWidth = 3;

    canvas.drawLine(
        Offset(0, position), Offset(width, position), indicatorPaint);

    
    final circlePaint = Paint()..color =  Color(0xFFBFFF00);
    canvas.drawCircle(Offset(0, position), 6, circlePaint);
  }

  @override
  bool shouldRepaint(covariant RulerPainter oldDelegate) {
    return oldDelegate.position != position;
  }
}
