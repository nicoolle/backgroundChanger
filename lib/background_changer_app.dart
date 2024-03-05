import 'dart:math';
import 'package:flutter/material.dart';

class BackgroundChangerApp extends StatefulWidget {
  const BackgroundChangerApp({super.key});

  @override
  _BackgroundChangerAppState createState() => _BackgroundChangerAppState();
}

class _BackgroundChangerAppState extends State<BackgroundChangerApp> {
  late Color backgroundColor;

  @override
  void initState() {
    super.initState();
    backgroundColor = _generateRandomColor();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeBackgroundColor,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: backgroundColor,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Center(
            child: Text(
              'Hello there',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  void _changeBackgroundColor() {
    setState(() {
      backgroundColor = _generateRandomColor();
    });
  }

  Color _generateRandomColor() {
    const int alphaOpaque = 255;
    const int colorRange = 256;
    final Random random = Random();
    return Color.fromARGB(
      alphaOpaque,
      random.nextInt(colorRange),
      random.nextInt(colorRange),
      random.nextInt(colorRange),
    );
  }
}
