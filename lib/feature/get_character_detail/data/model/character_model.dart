import 'package:dragon_ball_app/feature/get_character_detail/domain/entity/character_entity.dart';

class CharacterModel {
  int? id;
  String? name;
  String? ki;
  String? maxKi;
  String? race;
  String? gender;
  String? description;
  String? image;
  String? affiliation;
  OriginPlanet? originPlanet;
  List<Transformations>? transformations;

  CharacterModel({
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

  CharacterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ki = json['ki'];
    maxKi = json['maxKi'];
    race = json['race'];
    gender = json['gender'];
    description = json['description'];
    image = json['image'];
    affiliation = json['affiliation'];

    originPlanet = json['originPlanet'] != null
        ? OriginPlanet.fromJson(json['originPlanet'])
        : null;
    if (json['transformations'] != null) {
      transformations = <Transformations>[];
      json['transformations'].forEach((v) {
        transformations!.add(Transformations.fromJson(v));
      });
    }
  }

  CharacterEntity toCharacterEntity() {

    List<String> transformationList= transformations?.map((e) => e.image ?? "",).toList() ?? [];

    String originPlanetVar = originPlanet?.name ?? "";

  return  CharacterEntity(
      id: id,
      name: name,
      gender: gender,
      image: image,
      affiliation: affiliation,
      description: description,
      ki: ki,
      maxKi: maxKi,
      originPlanet: originPlanetVar,
      race: race,
      transformations: transformationList,
    );
  }
}

class OriginPlanet {
  int? id;
  String? name;
  bool? isDestroyed;
  String? description;
  String? image;

  OriginPlanet({
    this.id,
    this.name,
    this.isDestroyed,
    this.description,
    this.image,
  });

  OriginPlanet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isDestroyed = json['isDestroyed'];
    description = json['description'];
    image = json['image'];
  }
}

class Transformations {
  int? id;
  String? name;
  String? image;
  String? ki;

  Transformations({this.id, this.name, this.image, this.ki});

  Transformations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    ki = json['ki'];
  }
}
