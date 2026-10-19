import 'package:flutter/material.dart';

void main() {
  runApp(const MaCalculatrice());
}

class MaCalculatrice extends StatelessWidget {
  const MaCalculatrice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculatrice simple',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF8FF),
        useMaterial3: true,
      ),
      home: const CalculatricePage(),
    );
  }
}

class CalculatricePage extends StatefulWidget {
  const CalculatricePage({super.key});

  @override
  State<CalculatricePage> createState() => _CalculatricePageState();
}

class _CalculatricePageState extends State<CalculatricePage> {
  final TextEditingController nombre1Controller =
  TextEditingController();
  final TextEditingController nombre2Controller =
  TextEditingController();

  String resultat = '';

  void calculer(String operation) {
    double? n1 = double.tryParse(nombre1Controller.text);
    double? n2 = double.tryParse(nombre2Controller.text);

    if (n1 == null || n2 == null) {
      setState(() {
        resultat = 'Saisir deux nombres valides';
      });
      return;
    }

    double res;

    switch (operation) {
      case '+':
        res = n1 + n2;
        break;
      case '-':
        res = n1 - n2;
        break;
      case '×':
        res = n1 * n2;
        break;
      case '÷':
        if (n2 == 0) {
          setState(() {
            resultat = 'Division par zéro impossible';
          });
          return;
        }
        res = n1 / n2;
        break;
      default:
        return;
    }

    setState(() {
      resultat = res.toString();
      if (res == res.roundToDouble()) {
        resultat = res.toInt().toString();
      }
    });
  }

  void reset() {
    setState(() {
      nombre1Controller.clear();
      nombre2Controller.clear();
      resultat = '';
    });
  }

  @override
  void dispose() {
    nombre1Controller.dispose();
    nombre2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculatrice simple',
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: const Color(0xFF2196F3),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const Spacer(),


              TextField(
                controller: nombre1Controller,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Nombre 1',
                  labelStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF2196F3),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 4),

              // Deuxième nombre
              TextField(
                controller: nombre2Controller,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Nombre 2',
                  labelStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF2196F3),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              // Les quatre opérations
              Row(
                children: [
                  operationButton('+'),
                  const SizedBox(width: 8),
                  operationButton('-'),
                  const SizedBox(width: 8),
                  operationButton('×'),
                  const SizedBox(width: 8),
                  operationButton('÷'),
                ],
              ),

              const SizedBox(height: 16),

              // Bouton Reset
              ElevatedButton(
                onPressed: reset,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF9800),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(100, 40),
                  shape: const StadiumBorder(),
                  elevation: 0,
                ),
                child: const Text('Reset'),
              ),

              const SizedBox(height: 16),

              // Résultat sous le bouton Reset
              Text(
                resultat,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget operationButton(String operation) {
    return Expanded(
      child: SizedBox(
        height: 42,
        child: ElevatedButton(
          onPressed: () => calculer(operation),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF7F0F8),
            foregroundColor: const Color(0xFF665577),
            elevation: 1,
            padding: EdgeInsets.zero,
            shape: const StadiumBorder(),
          ),
          child: Text(
            operation,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}