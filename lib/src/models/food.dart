import 'package:food_delivery_app/src/models/category.dart';
import 'package:food_delivery_app/src/models/extra.dart';
import 'package:food_delivery_app/src/models/media.dart';
import 'package:food_delivery_app/src/models/nutrition.dart';
import 'package:food_delivery_app/src/models/restaurant.dart';
import 'package:food_delivery_app/src/models/review.dart';

class Food {
  String id;
  String name;
  double price;
  double discountPrice;
  Media image;
  String description;
  String ingredients;
  String weight;
  bool featured;
  Restaurant restaurant;
  Category category;
  List<Extra> extras;
  List<Review> foodReviews;
  List<Nutrition> nutritions;

  Food();

  Food.fromJSON(Map<String, dynamic> jsonMap) {
    id = jsonMap['id'].toString();
    name = jsonMap['name'];
    price = jsonMap['price'].toDouble();
    discountPrice = jsonMap['discount_price'] != null ? jsonMap['discount_price'].toDouble() : null;
    description = jsonMap['description'];
    ingredients = jsonMap['ingredients'];
    weight = jsonMap['weight'].toString();
    featured = jsonMap['featured'] ?? false;
    restaurant = jsonMap['restaurant'] != null ? Restaurant.fromJSON(jsonMap['restaurant']) : null;
    category = jsonMap['category'] != null ? Category.fromJSON(jsonMap['category']) : null;
    image = jsonMap['media'] != null ? Media.fromJSON(jsonMap['media'][0]) : null;
    extras = jsonMap['extras'] != null
        ? List.from(jsonMap['extras']).map((element) => Extra.fromJSON(element)).toList()
        : null;
    nutritions = jsonMap['nutrition'] != null
        ? List.from(jsonMap['nutrition']).map((element) => Nutrition.fromJSON(element)).toList()
        : null;
    foodReviews = jsonMap['food_reviews'] != null
        ? List.from(jsonMap['food_reviews']).map((element) => Review.fromJSON(element)).toList()
        : null;
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["name"] = name;
    map["price"] = price;
    map["discountPrice"] = discountPrice;
    map["description"] = description;
    map["ingredients"] = ingredients;
    map["weight"] = weight;
    return map;
  }
}
