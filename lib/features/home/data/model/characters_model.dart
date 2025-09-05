import 'package:dragon_ball_app/features/home/domain/entity/characters_entity.dart';

class CharactersModel {
  List<Items>? items;
  Meta? meta;
  Links? links;

  CharactersModel({this.items, this.meta, this.links});

  CharactersModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add( Items.fromJson(v));
      });
    }
    meta = json['meta'] != null ?  Meta.fromJson(json['meta']) : null;
    links = json['links'] != null ?  Links.fromJson(json['links']) : null;
  }

    List<CharactersEntity> toCharactersEntity() {
    if (items == null) return [];
    return items!.map((item) => CharactersEntity(
          id: item.id ?? 0,
          name: item.name ?? '',
          ki: item.ki,
          maxKi: item.maxKi,
          race: item.race,
          gender: item.gender,
          description: item.description,
          image: item.image,
          affiliation: item.affiliation,
        )).toList();
  }

 
}

class Items {
  int? id;
  String? name;
  String? ki;
  String? maxKi;
  String? race;
  String? gender;
  String? description;
  String? image;
  String? affiliation;
  

  Items(
      {this.id,
      this.name,
      this.ki,
      this.maxKi,
      this.race,
      this.gender,
      this.description,
      this.image,
      this.affiliation,
   });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ki = json['ki'];
    maxKi = json['maxKi'];
    race = json['race'];
    gender = json['gender'];
    description = json['description'];
    image = json['image'];
    affiliation = json['affiliation'];
  
  }

  
}

class Meta {
  int? totalItems;
  int? itemCount;
  int? itemsPerPage;
  int? totalPages;
  int? currentPage;

  Meta(
      {this.totalItems,
      this.itemCount,
      this.itemsPerPage,
      this.totalPages,
      this.currentPage});

  Meta.fromJson(Map<String, dynamic> json) {
    totalItems = json['totalItems'];
    itemCount = json['itemCount'];
    itemsPerPage = json['itemsPerPage'];
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
  }

 
}

class Links {
  String? first;
  String? previous;
  String? next;
  String? last;

  Links({this.first, this.previous, this.next, this.last});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    previous = json['previous'];
    next = json['next'];
    last = json['last'];
  }


}
