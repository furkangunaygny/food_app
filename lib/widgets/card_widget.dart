import 'package:flutter/material.dart';
import '../classes/card_class.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.card, required this.onTap});

  final CardClass card;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 280, 0, 0),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  blurRadius: BorderSide.strokeAlignOutside,
                  blurStyle: BlurStyle.outer)
            ],
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
                image: AssetImage(card.assetImage), fit: BoxFit.cover)),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                card.title,
                style: const TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
                textAlign: TextAlign.center,
              ),
              Text(
                "Fiyat: ${card.price} ₺",
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, color: Colors.yellow, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    card.rating.toString(),
                    style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
