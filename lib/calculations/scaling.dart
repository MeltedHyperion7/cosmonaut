import 'package:cosmonaut/constants.dart';

class Scaling {
  static const List<double> _distancesAU = [
    0.10, // Sun - Fact1
    0.09, // Fact1 - Fact2
    0.10, // Fact2 - Merc

    0.11, // Merc - Fact3
    0.12, // Fact3 - Fact4
    0.11, // Fact4 - Ven

    0.09, // Ven - Fact5
    0.10, // Fact5 - Fact6
    0.09, // Fact6 - Ear

    0.13, // Ear - Fact6
    0.13, // Fact6 - Fact7
    0.13, // Fact7 - Fact8
    0.13, // Fact8 - Mar

    0.8, // Mar - Fact9
    1.2, // Fact9 - Fact10
    1, // Fact10 - Fact11
    0.68, // Fact11 - Jup

    1.1, // Jup - Fact12
    1.1, // Fact12 - Fact13
    1.06, // Fact13 - Fact14
    1.06, // Fact14 - Sat

    1.05, // Sat - Fact15
    1.05, // Fact15 - Fact16
    1.05, // Fact16 - Fact17
    2.05, // Fact17 - Uar

    1.06, // Uar - Fact18
    1.06, // Fact18 - Fact19
    1.06, // Fact19 - Fact20
    1.06, // Fact20 - Fact21
    1.06, // Fact21 - Fact22
    1.06, // Fact22 - Fact23
    1.06, // Fact23 - Fact24
    1.06, //Fact24 - Nep
    1.06, //Nep - Fact25

  ];
  // 0.39, // Sun - Merc
  // 0.34, // Merc - Ven
  // 0.28, // Ven - Ear
  // 0.52, // Ear - Mar
  // 3.68, // Mar - Jup
  // 4.32, // Jup - Sat
  // 9.70, // Sat - Uar
  // 10.88, // Uar - Nep

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
