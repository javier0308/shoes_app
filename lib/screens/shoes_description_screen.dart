import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/helpers/helpers.dart';
import 'package:shoes_app/models/shoes_model.dart';
import 'package:shoes_app/widgets/shoes_button.dart';
import 'package:shoes_app/widgets/widgets.dart';

class ShoesDescriptionScreen extends StatelessWidget {
  const ShoesDescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Hero(
                tag: 'shoes-1',
                child: ShoesSize(
                  fullScreen: true,
                ),
              ),
              Positioned(
                top: 60,
                child: IconButton(
                  onPressed: () {
                    cambiarStatusDark();
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.chevron_left,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  ShoesDecription(
                    titulo: 'Nike Air Max 720',
                    subtitulo:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _PriceAndBuy(),
                  _BotonColores(),
                  _FloatingButtons()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FloatingButtons extends StatelessWidget {
  const _FloatingButtons();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _FloatButton(
            Icon(
              Icons.star,
              color: Colors.red,
              size: 25,
            ),
          ),
          _FloatButton(
            Icon(
              Icons.add_shopping_cart,
              color: Colors.grey.withOpacity(0.4),
              size: 25,
            ),
          ),
          _FloatButton(
            Icon(
              Icons.send,
              color: Colors.grey.withOpacity(0.4),
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}

class _FloatButton extends StatelessWidget {
  final Icon icon;
  const _FloatButton(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                spreadRadius: -5,
                blurRadius: 20,
                offset: Offset(0, 10))
          ]),
      child: icon,
    );
  }
}

class _BotonColores extends StatelessWidget {
  const _BotonColores();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: const [
                Positioned(
                  left: 90,
                  child: _Boton(Color(0xff43654B), 4, 'assets/verde.png'),
                ),
                Positioned(
                  left: 60,
                  child: _Boton(Color(0xff6C704F), 3, 'assets/amarillo.png'),
                ),
                Positioned(
                  left: 30,
                  child: _Boton(Color(0xff4E5376), 2, 'assets/azul.png'),
                ),
                _Boton(Color(0xff1F1F1F), 1, 'assets/negro.png'),
              ],
            ),
          ),
          const ShoesButton(
            texto: 'More related items',
            height: 30,
            width: 150,
            color: Color(0xffffc675),
          )
        ],
      ),
    );
  }
}

class _Boton extends StatelessWidget {
  final Color color;
  final int index;
  final String url;

  const _Boton(this.color, this.index, this.url);
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: 200 * index),
      child: GestureDetector(
        onTap: () {
          final shoesModel = Provider.of<ShoesModels>(context, listen: false);
          shoesModel.assetsImage = url;
        },
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _PriceAndBuy extends StatelessWidget {
  const _PriceAndBuy();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        children: [
          const Text(
            '\$180',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Bounce(
            duration: const Duration(milliseconds: 1200),
            from: 20,
            delay: const Duration(milliseconds: 800),
            infinite: true,
            child: const ShoesButton(
              texto: 'Buy now',
              height: 40,
              width: 120,
            ),
          )
        ],
      ),
    );
  }
}
