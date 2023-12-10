class Recipe {
  String? id;
  String? title;
  String? difficulty;
  String? portion;
  String? time;
  String? description;
  List<String>? ingredients;
  List<Map<String, String>>? method;
  String? image;

  Recipe({
    this.id,
    this.title,
    this.difficulty,
    this.portion,
    this.time,
    this.description,
    this.ingredients,
    this.method,
    this.image,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      title: json['title'],
      difficulty: json['difficulty'],
      portion: json['portion'],
      time: json['time'],
      description: json['description'],
      ingredients: List<String>.from(json['ingredients']),
      method: List<Map<String, String>>.from(json['method'].map((x) => Map<String, String>.from(x))),
      image: json['image'],
    );
  }
}