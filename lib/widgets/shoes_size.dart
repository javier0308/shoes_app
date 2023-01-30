import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/models/shoes_model.dart';
import 'package:shoes_app/screens/shoes_description_screen.dart';

class ShoesSize extends StatelessWidget {
  final bool fullScreen;
  const ShoesSize({super.key, this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ShoesDescriptionScreen(),
            ),
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (fullScreen) ? 5 : 30,
          vertical: (fullScreen) ? 5 : 0,
        ),
        child: Container(
          width: double.infinity,
          height: (fullScreen) ? 383 : 400,
          decoration: BoxDecoration(
            color: const Color(0xffFFcF53),
            borderRadius: (fullScreen)
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))
                : BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              _Shoes(),
              const Spacer(),
              if (!fullScreen) _ShoesTallas(),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Shoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shoesModel = Provider.of<ShoesModels>(context);
    return Stack(
      children: [
        Positioned(
          bottom: 60,
          right: 50,
          child: _ShadowShoes(),
        ),
        Padding(
          padding: const EdgeInsets.all(50),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            curve: Curves.bounceOut,
            height: shoesModel.heightShoes,
            child: Image.asset(
              shoesModel.assetsImage,
            ),
          ),
        ),
      ],
    );
  }
}

class _ShadowShoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        height: 110,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(color: Color(0xffeaa14e), blurRadius: 40),
          ],
        ),
      ),
    );
  }
}

class _ShoesTallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _TallaZapato(7),
          _TallaZapato(7.5),
          _TallaZapato(8),
          _TallaZapato(8.5),
          _TallaZapato(9),
          _TallaZapato(9.5),
        ],
      ),
    );
  }
}

class _TallaZapato extends StatelessWidget {
  final double talla;

  const _TallaZapato(this.talla);

  @override
  Widget build(BuildContext context) {
    final shoesModel = Provider.of<ShoesModels>(context);
    return GestureDetector(
      onTap: () {
        final modelShoes = Provider.of<ShoesModels>(context, listen: false);

        if (talla == 7) {
          modelShoes.talla = talla;
          modelShoes.heightShoes = 185;
        }
        if (talla == 7.5) {
          modelShoes.talla = talla;
          modelShoes.heightShoes = 195;
        }
        if (talla == 8) {
          modelShoes.talla = talla;
          modelShoes.heightShoes = 205;
        }
        if (talla == 8.5) {
          modelShoes.talla = talla;
          modelShoes.heightShoes = 215;
        }
        if (talla == 9) {
          modelShoes.talla = talla;
          modelShoes.heightShoes = 225;
        }
        if (talla == 9.5) {
          modelShoes.talla = talla;
          modelShoes.heightShoes = 235;
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color:
              (talla == shoesModel.talla) ? Colors.yellow[800] : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (talla == shoesModel.talla)
              const BoxShadow(
                  color: Color(0xffeaa14e),
                  blurRadius: 10,
                  offset: Offset(0, 5)),
          ],
        ),
        child: Text(
          talla.toString().replaceAll('.0', ''),
          style: TextStyle(
              color: (talla == shoesModel.talla)
                  ? Colors.white
                  : const Color(0xfff1a23a),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
