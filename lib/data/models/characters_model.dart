
class Character {
  int? id;
  String? name;
  String? status;
  String? species;
  String? gender;
  String? image;
  List? episodes;
  Origin? origin;
  Location? location;

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    gender = json['gender'];
    image = json['image'];
    episodes = json['episode'];
    origin = Origin.fromJson(json['origin']);
    location = Location.fromJson(json['location']);
  }
}

class Origin {
  String? name;

  Origin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}

class Location {
  String? location;

  Location.fromJson(Map<String, dynamic> json) {
    location = json['name'];
  }
}
