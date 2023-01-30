import 'package:flutter/material.dart';
import 'package:shoes_app/helpers/helpers.dart';

import 'package:shoes_app/widgets/widgets.dart';

class ShoesScreen extends StatelessWidget {
  const ShoesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cambiarStatusDark();
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'For You'),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: const [
                Hero(
                  tag: 'shoes-1',
                  child: ShoesSize(),
                ),
                ShoesDecription(
                  titulo: 'Nike Air Max 720',
                  subtitulo:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
              ],
            ),
          ),
          const ShoesPrice(price: 180.0)
        ],
      ),
    );
  }
}
