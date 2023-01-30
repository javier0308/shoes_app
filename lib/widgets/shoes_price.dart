import 'package:flutter/material.dart';
import 'package:shoes_app/widgets/shoes_button.dart';

class ShoesPrice extends StatelessWidget {
  final double price;
  const ShoesPrice({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Text(
            '\$$price',
            style: const TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const Spacer(),
          const ShoesButton(texto: 'Add to car'),
          const SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}
