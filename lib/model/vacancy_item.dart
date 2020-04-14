class VacancyItem {
  String category;
  String name;
  String gen;
  String obc;
  String bca;
  String bcb;
  String ews;
  String sc;
  String st;
  String ph;
  String total;
  String age;
  String eligibility;

  VacancyItem({
    this.category,
    this.name,
    this.gen,
    this.obc,
    this.bca,
    this.bcb,
    this.ews,
    this.sc,
    this.st,
    this.ph,
    this.total,
    this.age,
    this.eligibility,
  });

  Map<String, dynamic> toMap() {
    return {
      "category": category,
      "name": name,
      "gen": gen,
      "obc": obc,
      "bca": bca,
      "bcb": bcb,
      "ews": ews,
      "sc": sc,
      "st": st,
      "ph": ph,
      "total": total,
      "age": age,
      "eligibility": eligibility,
    };
  }

  factory VacancyItem.fromMap(Map<dynamic, dynamic> map) {
    return VacancyItem(
      category: map['category'],
      name: map['name'],
      gen: map['gen'],
      obc: map['obc'],
      bca: map['bca'],
      bcb: map['bcb'],
      ews: map['ews'],
      sc: map['sc'],
      st: map['st'],
      ph: map['ph'],
      total: map['total'],
      age: map['age'],
      eligibility: map['eligibility'],
    );
  }
}
