import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:medongosupport/preConsultModule/controllers/preConsultationController.dart';
import 'package:medongosupport/preConsultModule/widgets/coordinatesTranslator.dart';

class FaceDetectorPainter extends CustomPainter {
  FaceDetectorPainter(this.faces, this.absoluteImageSize, this.rotation);
  final  List<Face> faces;
  final Size absoluteImageSize;
  final InputImageRotation rotation;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = Colors.green;

    for (final Face face in faces) {
      final Rect boundingBox = face.boundingBox;
      final double left =
      translateX(boundingBox.left, rotation, size, absoluteImageSize);
      preConsultationController.left.value=left;
      final double top =
      translateY(boundingBox.top, rotation, size, absoluteImageSize);
      preConsultationController.top.value=top;
      final double right =
      translateX(boundingBox.right, rotation, size, absoluteImageSize);
      preConsultationController.right.value=right;
      final double bottom =
      translateY(boundingBox.bottom, rotation, size, absoluteImageSize);
      preConsultationController.bottom.value=bottom;


      canvas.drawRect(
        Rect.fromLTRB(left, top, right, bottom),
        paint,
      );
      ///vikas - delete it after detection the coordinates
      final String coordinates = 'Left: ${left.toStringAsFixed(2)}, '
          'Top: ${top.toStringAsFixed(2)},'
          ' Right: ${right.toStringAsFixed(2)},'
          ' Bottom: ${bottom.toStringAsFixed(2)}';
      debugPrint(coordinates);
      print('a nauna yakh h maei ............$coordinates');

      // Draw the coordinates of the bounding box
      final TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: coordinates,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(left, top));


    }
  }

  @override
  bool shouldRepaint(FaceDetectorPainter oldDelegate) {
    return oldDelegate.absoluteImageSize != absoluteImageSize ||
        oldDelegate.faces != faces;
  }
}