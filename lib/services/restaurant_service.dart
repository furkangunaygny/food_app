/*import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:food_app/models/restourants_model.dart';
import 'package:http/http.dart' as http;

Future<List<Restaurant>> fetchFoods() async {
  final url = Uri.parse(
      "https://tripadvisor16.p.rapidapi.com/api/v1/restaurant/searchRestaurants?locationId=304554");

  final response = await http.get(
    url,
    headers: {
      'x-rapidapi-host': 'tripadvisor16.p.rapidapi.com',
      'x-rapidapi-key': '9238fdc062msh89281d7c1f0be65p1aff2fjsn2e621d0db6f2',
    },
  );
  if (kDebugMode) {
    print(response.body);
  }

  if (response.statusCode == 200) {
    final data = json.decode(response.body);

    final List<dynamic> restaurantList = (data['data']?['data'] ?? []) as List;

    if (restaurantList.isEmpty) {
      throw Exception('API boş veri döndü: restaurant listesi null');
    }

    List<Restaurant> restaurants = restaurantList.map((res) {
      return Restaurant(
        name: res['name'] ?? '',
        rating: res['averageRating']?.toString() ?? '',
        price: res['priceTag'] ?? '',
        description: '',
        imageUrl: res['heroImgUrl'] ??
            'https://dummyimage.com/150x150/cccccc/ffffff.png&text=No+Image',
        meals: (res['establishmentTypeAndCuisineTags'] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            [],
      );
    }).toList();

    return restaurants;
  } else {
    throw Exception("Veri alınamadı. Kod: ${response.statusCode}");
  }
}
*/