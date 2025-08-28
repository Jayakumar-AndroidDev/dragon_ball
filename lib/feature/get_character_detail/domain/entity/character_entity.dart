class CharacterEntity {
  int? id;
  String? name;
  String? ki;
  String? maxKi;
  String? race;
  String? gender;
  String? description;
  String? image;
  String? affiliation;
  String? originPlanet;
  List<String>? transformations;

  CharacterEntity({
    this.id,
    this.name,
    this.ki,
    this.maxKi,
    this.race,
    this.gender,
    this.description,
    this.image,
    this.affiliation,
    this.originPlanet,
    this.transformations,
  });
}
