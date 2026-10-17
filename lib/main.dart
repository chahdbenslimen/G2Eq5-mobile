import 'package:flutter/material.dart';

void main() => runApp(const CarteEtudiant());

class CarteEtudiant extends StatelessWidget {
  const CarteEtudiant({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Carte Étudiant'),
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Colonne de gauche : la photo
                const CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage('https://picsum.photos/150'),
                ),
                const SizedBox(width: 16),
                // Colonne de droite : les informations
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Alia Tounsi',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text('Spécialité : E-Business'),
                      const SizedBox(height: 10),
                      const Text(
                        'Objectif :',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Motivée pour devenir développeuse mobile Flutter.',
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Email :',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text('alia.tounsi@example.com'),
                      const SizedBox(height: 6),
                      const Text(
                        'Téléphone :',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text('+216 20 123 456'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}