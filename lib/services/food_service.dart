import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/food_model.dart';

const String apiKey = "2d321fce366a4fc4b387ae6ce71ccc52";

Future<List<Recipe>> fetchFoods() async {
  final url = Uri.parse(
      "https://api.spoonacular.com/recipes/complexSearch?number=10&addRecipeInformation=true&apiKey=$apiKey");

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);

    List<Recipe> recipes = (data['results'] as List).map((item) {
      return Recipe(
        title: item['title'] ?? 'No Title',
        image: item['image'] ?? 'No image',
        price: (item['pricePerServing'] ?? 0).toDouble(),
        rating: (item['spoonacularScore'] ?? 0).toDouble() / 20,
        maxReadyTime:(item['maxReadyTime']??0).toDouble(),
      );
    }).toList();

    return recipes;
  } else {
    throw Exception("Veri alınamadı. Kod: ${response.statusCode}");
  }
}
