class Arac {
  Arac({
    required this.renk,
    required this.vites,
  });

  final String renk;
  final String vites;
}

class Araba extends Arac {
  Araba({
    required super.renk,
    required super.vites,
    required this.kasaTipi,
  });

  final String kasaTipi;
}

class Nissan extends Araba {
  Nissan({
    required super.renk,
    required super.vites,
    required super.kasaTipi,
    required this.model,
  });

  final String model;
}

void test() {
  var araba = Nissan(renk: "renk", vites: "vites", kasaTipi: "kasaTipi", model: "model");
}
