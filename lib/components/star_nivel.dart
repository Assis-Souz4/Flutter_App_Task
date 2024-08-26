import 'package:flutter/material.dart';

class StarNivel extends StatelessWidget {
  final int starNivelDifficulty;

  const StarNivel({required this.starNivelDifficulty, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: (starNivelDifficulty >= 1) ? Colors.amber : Colors.amber[100],size: 14,
        ),
        Icon(
          Icons.star,
          color: (starNivelDifficulty >= 2) ? Colors.amber : Colors.amber[100],size: 14,
        ),
        Icon(
          Icons.star,
          color: (starNivelDifficulty >= 3) ? Colors.amber : Colors.amber[100],size: 14,
        ),
        Icon(
          Icons.star,
          color: (starNivelDifficulty >= 4) ? Colors.amber : Colors.amber[100],size: 14,
        ),
        Icon(
          Icons.star,
          color: (starNivelDifficulty >= 5) ? Colors.amber : Colors.amber[100],size: 14,
        ),
      ],
    );
  }
}
