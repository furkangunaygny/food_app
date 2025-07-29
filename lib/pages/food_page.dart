import 'package:flutter/material.dart';
import 'package:food_app/classes/food_class.dart';
import 'package:food_app/models/food_model.dart';
import 'package:food_app/models/restourants_model.dart';
import 'package:food_app/services/food_service.dart';
import 'package:food_app/services/restaurant_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FoodPage extends StatefulWidget {
  final Food food;

  const FoodPage({super.key, required this.food});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

String cleanImageUrl(String url) {
  return url.split('?').first;
}

String formatlaOndalik(num sayi) {
  final formatter = NumberFormat("0.0", "en_US");
  return formatter.format(sayi);
}

String formatlaVirgulle(num sayi) {
  final formatter = NumberFormat("#,##0.##", "en_US");
  return formatter.format(sayi);
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    final food = widget.food;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: NetworkImage(cleanImageUrl(food.image)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 110, 10, 20),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: BorderSide.strokeAlignOutside)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(food.title),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //Restaurant Information
                              Row(
                                children: [
                                  const Icon(
                                    Icons.motorcycle,
                                    color: Colors.green,
                                  ),
                                  Text(
                                    'Ücretsiz Teslimat',
                                    style:
                                        GoogleFonts.abel(color: Colors.green),
                                  )
                                ],
                              ),
                              //Rating Information

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    formatlaOndalik(food.rating).toString(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(160, 45, 160, 20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      blurRadius: BorderSide.strokeAlignOutside)
                                ],
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: Icon(
                              Icons.not_listed_location_sharp,
                              size: 70,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ), /*
              ListView.builder(
                shrinkWrap: true,
                itemCount: foodList.length,
                itemBuilder: (context, index) {
                  final foods = [index];
                  return GestureDetector(
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(food.title),
                          Text((formatlaVirgulle(food.price).toString())),
                        ],
                      ),
                    ),
                  );
                },
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
