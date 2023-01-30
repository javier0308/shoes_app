import 'package:flutter/material.dart';

class ShoesDecription extends StatelessWidget {
  final String titulo, subtitulo;
  const ShoesDecription(
      {super.key, required this.titulo, required this.subtitulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            titulo,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subtitulo,
            style: const TextStyle(color: Colors.black54, height: 1.6),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
