import 'package:flutter/material.dart';

class ShoesButton extends StatelessWidget {
  final String texto;
  final double height, width;
  final Color color;
  const ShoesButton({
    super.key,
    required this.texto,
    this.height = 50,
    this.width = 150,
    this.color = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        texto,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
