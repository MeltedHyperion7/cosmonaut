class ScrollingDistances {
  final double scale;

  const ScrollingDistances(this.scale);

  final List<double> _distancesAU = const [
    0.39, // Sun - Merc
    0.34, // Merc - Ven
    0.28, // Ven - Ear
    0.52, // Ear - Mar
    3.68, // Mar - Jup
    4.32, // Jup - Sat
    9.70, // Sat - Uar
    10.88, // Uar - Nep
  ];

  double getDistance(int i) {
    return scale * _distancesAU[i];
  }
}
