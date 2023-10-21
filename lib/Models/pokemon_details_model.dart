class PokemonDetailsModel {
  List<Abilities>? abilities;
  int? height;
  String? name;
  int? weight;
  Sprites? sprites;

  PokemonDetailsModel({this.abilities, this.height, this.name, this.weight, this.sprites});

  PokemonDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['abilities'] != null) {
      abilities = <Abilities>[];
      json['abilities'].forEach((v) {
        abilities!.add(new Abilities.fromJson(v));
      });
    }
    name = json['name'];
    height = json['height'];
    sprites = json['sprites'] != null ? new Sprites.fromJson(json['sprites']) : null;
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['height'] = this.height;
    data['weight'] = this.weight;
    if (this.abilities != null) {
      data['results'] = this.abilities!.map((v) => v.toJson()).toList();
    }
    if (this.sprites != null) {
      data['sprites'] = this.sprites!.toJson();
    }
    return data;
  }
}

class Abilities {
  String? name;
  String? url;

  Abilities({this.name, this.url});

  Abilities.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Sprites {
  String? backDefault;
  String? backShiny;
  String? frontDefault;
  String? frontShiny;

  Sprites({this.backDefault, this.backShiny, this.frontDefault, this.frontShiny,});

  Sprites.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backShiny = json['back_shiny'];
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['back_default'] = this.backDefault;
    data['back_shiny'] = this.backShiny;
    data['front_default'] = this.frontDefault;
    data['front_shiny'] = this.frontShiny;
    return data;
  }
}
