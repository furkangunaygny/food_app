import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/food_model.dart';

const String apiKey = "2d321fce366a4fc4b387ae6ce71ccc52";

///
///
/// getFetchADASD
///
/// asdasd asdasd ad
///
/// Yemekleri çeken servis
///
/// return List'<Food>'
///
///
String getUrl(int page, String apiKey) {
  const int perPage = 20;
  int offset = (page - 1) * perPage;
  return 'https://api.spoonacular.com/recipes/complexSearch?number=$perPage&offset=$offset&addRecipeInformation=true&apiKey=$apiKey';
}

Future<List<Food>> fetchFoods(page) async {
  final String url = getUrl(page, apiKey);

  final response = await http.get(Uri.parse(url));
  

  if (response.statusCode == 200) {
    final data = json.decode(response.body);

    List<Food> foods = (data['results'] as List).map((item) {
      return Food(
        title: item['title'] ?? 'No Title',
        image: item['image'] ?? 'No image',
        price: (item['pricePerServing'] ?? 0),
        rating: (item['spoonacularScore'] ?? 0) / 20,
        maxReadyTime: (item['maxReadyTime'] ?? 0),
      );
    }).toList();

    return foods;
  } else {
    throw Exception("Veri alınamadı. Kod: ${response.statusCode}");
  }
}
