
class Produit {
  String nom;
  double prix;
  bool disponible;

  Produit(this.nom, this.prix, this.disponible);
}

void main() {
  List<Produit> produits = [
    Produit('Ordinateur portable', 1700.00, true),
    Produit('Téléphone portable', 850.50, false),
    Produit('Clavier', 49.99, true),
    Produit('Souris', 25.00, true),
    Produit('Imprimante', 350.00, false),
  ];

  for (int i = 0; i < produits.length; i++) {
    Produit p = produits[i];

    if (p.disponible) {
      print(
        'Produit disponible : ${p.nom} - Prix : ${p.prix.toStringAsFixed(2)} dinars'
      );
    }
  }
}
