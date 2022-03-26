import 'package:dro_app/utility/export_utilities.dart';
import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget {
  final double opacity;
  final double radius;
  const CustomCircle({Key? key, required this.opacity, required this.radius});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomPaint(
        size: const Size(double.infinity, double.infinity),
        child: Container(
          color: Colors.transparent,
        ),
        painter: CirclePainter(opacity: opacity, radius: radius),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double opacity;
  final double radius;
  CirclePainter({required this.opacity, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    Paint wavePaint = Paint()
      ..color = white.withOpacity(opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.4
      ..isAntiAlias = true;
    double centerX = size.width / 10.0;
    double centerY = size.height / 1.5;
    canvas.drawCircle(Offset(centerX, centerY), radius, wavePaint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => false;
}
//
// class CustomCircle extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     int curveHeight = 40;
//     Offset controlPoint = Offset(size.width / 2, size.height + curveHeight);
//     Offset endPoint = Offset(size.width, size.height - curveHeight);
//
//     Path path = Path()
//       ..lineTo(0, size.height - curveHeight)
//       ..quadraticBezierTo(
//           controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
//       ..lineTo(size.width, 0)
//       ..close();
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
