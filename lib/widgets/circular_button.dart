import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function onPressed;

  const CircularButton({ 
    Key? key, 
    required this.width, 
    required this.height, 
    required this.icon, 
    required this.onPressed,
    this.color = Colors.blueAccent, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(onPressed: () => onPressed(), icon: icon, color: Colors.white, enableFeedback: true),
    );
  }
}