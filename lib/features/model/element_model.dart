class ElementModel {
  final String symbol;
  final String nameRu;
  final String nameEn;
  final int atomicNumber;
  final double atomicMass;
  final String color;
  final String standardStateRu;
  final String standardStateEn;
  final String groupBlockRu;
  final String groupBlockEn;
  final String electronicConfiguration;
  final String oxidationStates;
  final String usageRu;
  final String usageEn;
  final String discoveryRu;
  final String discoveryEn;
  final String factRu;
  final String factEn;

  ElementModel({required this.symbol, required this.nameRu, required this.nameEn, required this.atomicNumber, required this.atomicMass, required this.color, required this.standardStateRu, required this.standardStateEn, required this.groupBlockRu, required this.groupBlockEn, required this.electronicConfiguration, required this.oxidationStates, required this.usageRu, required this.usageEn, required this.discoveryRu, required this.discoveryEn, required this.factRu, required this.factEn});

  factory ElementModel.jromJson(Map<String, dynamic> json) {
    final symbol = json["symbol"].toString();
    final nameRu = json["nameRu"].toString();
    final nameEn = json["nameEn"].toString();
    final color = json["color"].toString();
    final standardStateRu = json["standardStateRu"].toString();
    final standardStateEn = json["standardStateEn"].toString();
    final groupBlockRu = json["groupBlockRu"].toString();
    final groupBlockEn = json["groupBlockEn"].toString();
    final electronicConfiguration = json["electronicConfiguration"].toString();
    final oxidationStates = json["oxidationStates"].toString();
    final usageRu = json["usageRu"].toString();
    final usageEn = json["usageEn"].toString();
    final discoveryRu = json["discoveryRu"].toString();
    final discoveryEn = json["discoveryEn"].toString();
    final factRu = json["factRu"].toString();
    final factEn = json["factEn"].toString();

    final atomicNumber = json["atomicNumber"] as int;
    final atomicMass = json["atomicMass"] as double;

    return ElementModel(
      symbol: symbol, 
      nameRu: nameRu, 
      nameEn: nameEn, 
      atomicNumber: atomicNumber, 
      atomicMass: atomicMass, 
      color: color, 
      standardStateRu: standardStateRu, 
      standardStateEn: standardStateEn, 
      groupBlockRu: groupBlockRu, 
      groupBlockEn: groupBlockEn, 
      electronicConfiguration: electronicConfiguration, 
      oxidationStates: oxidationStates, 
      usageRu: usageRu, 
      usageEn: usageEn, 
      discoveryRu: discoveryRu, 
      discoveryEn: discoveryEn, 
      factRu: factRu, 
      factEn: factEn
    );
  }
}