class Animals {
  String? name;
  String? sex;
  String? age;
  String? race;
  String? image;

  Animals(
    this.name,
    this.sex,
    this.age,
    this.race,
    this.image,
  );

  Animals.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    sex = json["sex"];
    age = json["age"];
    race = json["race"];
    image = json["image"];
  }

  Animals.empty() {
    name = '';
    sex = '';
    age = '';
    race = '';
    image = '';
  }

  Map<String, dynamic> toFilterMap() {
    return {
      'name': name!,
    };
  }
}
