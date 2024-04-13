import 'package:cosmonaut/constants.dart';

class Scaling {
  static const List<double> _distancesAU = [
    0.39, // Sun - Merc
    0.34, // Merc - Ven
    0.28, // Ven - Ear
    0.52, // Ear - Mar
    3.68, // Mar - Jup
    4.32, // Jup - Sat
    9.70, // Sat - Uar
    10.88, // Uar - Nep
  ];

  static const List<double> _diametersAU = [
    36.00, // Sun
    1.00, // Merc
    2.48, // Ven
    2.61, // Ear
    1.39, // Mar
    16.00, // Jup
    18.00, // Sat
    10.48, // Uar
    10.15, // Nep
  ];

  static double getDistance(int i) {
    return DISTANCE_SCALE * _distancesAU[i];
  }

  static double getDiameter(int i) {
    return PLANET_SCALE * _diametersAU[i];
  }
}
