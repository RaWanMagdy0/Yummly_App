
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;
  final String backgroundImage;
  final double overlayOpacity;

  const CustomScaffold({
    super.key,
    required this.child,
    required this.backgroundImage,
    this.overlayOpacity = 0.6,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(backgroundImage, fit: BoxFit.cover),
          ),

          Positioned.fill(child: SafeArea(child: child)),
        ],
      ),
    );
  }
}
