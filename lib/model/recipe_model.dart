class RecipeResponseModel {
  List<RecipeModel>? recipes;

  RecipeResponseModel({this.recipes});

  RecipeResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      recipes = <RecipeModel>[];
      json['data'].forEach((v) {
        recipes!.add(RecipeModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (recipes != null) {
      data['data'] = recipes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecipeModel {
  int? id;
  String? name;
  String? description;
  String? image;
  double? rating;
  String? cuisine;
  int? cookTimeMinutes;
  String? category;
  int? isTrending;
  int? isLatest;
  List<String>? ingredients;

  RecipeModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.rating,
    this.cuisine,
    this.cookTimeMinutes,
    this.category,
    this.isTrending,
    this.isLatest,
    this.ingredients,
  });

  RecipeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    rating = json['rating']?.toDouble();
    cuisine = json['cuisine'];
    cookTimeMinutes = json['cook_time_minutes'];
    category = json['category'];
    isTrending = json['is_trending'];
    isLatest = json['is_latest'];
    ingredients = json['ingredients']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['rating'] = rating;
    data['cuisine'] = cuisine;
    data['cook_time_minutes'] = cookTimeMinutes;
    data['category'] = category;
    data['is_trending'] = isTrending;
    data['is_latest'] = isLatest;
    data['ingredients'] = ingredients;
    return data;
  }
}
