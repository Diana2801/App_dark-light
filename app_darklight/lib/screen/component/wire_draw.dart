import 'package:app_darklight/app_theme.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wire extends StatefulWidget {
  const Wire(
      {super.key, required this.initialPosition, required this.toOffset});
  final Offset initialPosition;
  final Offset toOffset;

  @override
  State<Wire> createState() => _WireState();
}

class _WireState extends State<Wire> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return CustomPaint(
      painter: WirePainter(
        initialPosition: widget.initialPosition,
        toOffset: widget.toOffset,
        themeProvider: themeProvider,
      ),
    );
  }
}

class WirePainter extends CustomPainter {
  final Offset initialPosition;
  final Offset toOffset;
  final ThemeProvider themeProvider;

  Paint? _paint;

  WirePainter(
      {required this.initialPosition,
      required this.toOffset,
      required this.themeProvider});
  void paint(Canvas canvas, Size size) {
    _paint = Paint()
    ..color = themeProvider.themeMode().switchColor!
    ..strokeWidth = 10
    ..style = PaintingStyle.stroke;
  }

  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
