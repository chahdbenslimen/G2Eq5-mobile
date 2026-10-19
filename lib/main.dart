
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApplication());
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mon Compteur',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const CompteurPage(),
    );
  }
}

class CompteurPage extends StatefulWidget {
  const CompteurPage({super.key});

  @override
  State<CompteurPage> createState() => _CompteurPageState();
}

class _CompteurPageState extends State<CompteurPage> {
  int compteur = 0;

  void incrementer() {
    setState(() {
      compteur++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3FF),
      appBar: AppBar(
        title: const Text('Mon Compteur'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Valeur actuelle',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '$compteur',
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 35),
            ElevatedButton.icon(
              onPressed: incrementer,
              icon: const Icon(Icons.add),
              label: const Text('Incrémenter'),
            ),
          ],
        ),
      ),
    );
  }
}
