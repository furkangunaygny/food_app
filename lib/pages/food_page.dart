import 'package:flutter/material.dart';
import 'package:food_app/models/cart_model.dart';
import 'package:food_app/models/food_model.dart';
import 'package:food_app/models/theme_model.dart';
import 'package:food_app/pages/cart_page.dart';
import 'package:food_app/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// import 'package:food_app/services/food_service.dart';
// import 'package:food_app/classes/food_class.dart';
// import 'package:food_app/services/restaurant_service.dart';
// import 'package:food_app/models/restourants_model.dart';

///
///
///Restorantların Detay Sayfası
///
///

class FoodPage extends StatefulWidget {
  final Food food;
  final List<Food> foodList;

  const FoodPage({super.key, required this.food, required this.foodList});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

//Url den gelen resme verilen sabit ölçüyü kaldırma

String cleanImageUrl(String url) {
  return url.split('?').first;
}

//Double sayının ilk ondalıklı kısmını alma

String formatlaOndalik(num sayi) {
  final formatter = NumberFormat("0.0", "en_US");
  return formatter.format(sayi);
}

//Gelen sayıyı 3'erli basamaklara ayırma

String formatlaVirgulle(num sayi) {
  final formatter = NumberFormat("#,##0.##", "en_US");
  return formatter.format(sayi);
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    final foodList = widget.foodList;
    final food = widget.food;
    return Scaffold(
        backgroundColor: AppTheme.backColor,

        //CartPage Navigation

        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ))
          },
          backgroundColor: AppTheme.appColor,
          child: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
          ),
        ),

        /*
      appBar: AppBar(
      
        backgroundColor: Colors.red,
        flexibleSpace: FlexibleSpaceBar(
          title: Text(food.title),
        ),
        bottom: PreferredSize(
            preferredSize: Size(300, 200),
            child: ConstrainedBox(constraints: BoxConstraints())),
      ),*/

        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            //Restaurant Information SliverAppBar

            SliverAppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  },
                  icon: Icon(Icons.arrow_back_ios_new,
                      color: AppTheme.iconColor)),
              pinned: true,
              scrolledUnderElevation: 5,
              shadowColor: Colors.black,
              backgroundColor: AppTheme.backColor,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.loose,
                  children: [
                    Container(
                      height: 300,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          //Restorant Logosu

                          Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color.fromARGB(
                                          255, 191, 191, 191),
                                      blurRadius: 4)
                                ],
                                color: AppTheme.backColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Icon(
                              Icons.not_listed_location_sharp,
                              color: AppTheme.iconColor,
                              size: 70,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 80,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color.fromARGB(
                                          255, 188, 188, 188),
                                      blurRadius: BorderSide.strokeAlignOutside)
                                ],
                                color: AppTheme.backColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  food.title,
                                  style: GoogleFonts.fjallaOne(
                                      color: AppTheme.textColor),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                          style: GoogleFonts.abel(
                                              color: Colors.green),
                                        )
                                      ],
                                    ),

                                    //Rating Information

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        Text(
                                          overflow: TextOverflow.ellipsis,
                                          formatlaOndalik(food.rating)
                                              .toString(),
                                          style: TextStyle(
                                              color: AppTheme.textColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Food Listing
            SliverToBoxAdapter(child: SizedBox(height: 30)),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Transform.translate(
                    offset: Offset(0, -20),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.backColor,
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        children: List.generate(foodList.length, (index) {
                          final foods = foodList[index];

                          return Column(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 600,
                                    height: 100,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                                style: GoogleFonts.fjallaOne(
                                                    color: AppTheme.textColor),
                                                maxLines: 2,
                                                foods.title.length > 30
                                                    ? '${foods.title.substring(0, 30)}...'
                                                    : foods.title),
                                            Text(
                                              ('${formatlaVirgulle(foods.price).toString()} TL'),
                                              style: GoogleFonts.fjallaOne(
                                                  color: Colors.green),
                                            ),
                                          ],
                                        ),
                                        Stack(
                                          children: [
                                            Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      foods.image,
                                                    ),
                                                    fit: BoxFit.cover),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            Positioned(
                                              top: 60,
                                              left: 60,
                                              //Sepete Ekleme
                                              child: InkWell(
                                                onTap: () {
                                                  Provider.of<CartModel>(
                                                          context,
                                                          listen: false)
                                                      .addToCart(foods);
                                                  //Sepete Eklendi Mesajı
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      backgroundColor:
                                                          AppTheme.backColor,
                                                      content: Text(
                                                        '${foods.title} sepete eklendi',
                                                        style: TextStyle(
                                                            color: AppTheme
                                                                .textColor),
                                                      ),
                                                      duration:
                                                          Duration(seconds: 1),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      color: AppTheme.backColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  child: Icon(
                                                    Icons.add,
                                                    color: AppTheme.iconColor,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                color: AppTheme.textColor,
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
        // SingleChildScrollView(
        //   physics: BouncingScrollPhysics(),
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Column(
        //       children: [
        //         Stack(
        //           fit: StackFit.loose,
        //           children: [
        //             Container(
        //               height: 200,
        //               decoration: BoxDecoration(
        //                 borderRadius: const BorderRadius.all(Radius.circular(10)),
        //                 image: DecorationImage(
        //                   image: NetworkImage(cleanImageUrl(food.image)),
        //                   fit: BoxFit.cover,
        //                 ),
        //               ),
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.fromLTRB(10, 110, 10, 20),
        //               child: Container(
        //                 height: 80,
        //                 decoration: BoxDecoration(
        //                     boxShadow: [
        //                       BoxShadow(
        //                           color: Colors.black,
        //                           blurRadius: BorderSide.strokeAlignOutside)
        //                     ],
        //                     color: Colors.white,
        //                     borderRadius: BorderRadius.circular(10)),
        //                 child: Column(
        //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                   children: [
        //                     Text(food.title),
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                       children: [
        //                         //Restaurant Information
        //                         Row(
        //                           children: [
        //                             const Icon(
        //                               Icons.motorcycle,
        //                               color: Colors.green,
        //                             ),
        //                             Text(
        //                               'Ücretsiz Teslimat',
        //                               style:
        //                                   GoogleFonts.abel(color: Colors.green),
        //                             )
        //                           ],
        //                         ),
        //                         //Rating Information

        //                         Row(
        //                           mainAxisAlignment: MainAxisAlignment.center,
        //                           children: [
        //                             const Icon(
        //                               Icons.star,
        //                               color: Colors.yellow,
        //                             ),
        //                             Text(
        //                               overflow: TextOverflow.ellipsis,
        //                               formatlaOndalik(food.rating).toString(),
        //                               style: TextStyle(color: Colors.black),
        //                             ),
        //                           ],
        //                         ),
        //                       ],
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.fromLTRB(160, 45, 160, 20),
        //               child: Row(
        //                 children: [
        //                   Expanded(
        //                     flex: 1,
        //                     child: Container(
        //                       decoration: BoxDecoration(
        //                           boxShadow: [
        //                             BoxShadow(
        //                                 color: Colors.black,
        //                                 blurRadius: BorderSide.strokeAlignOutside)
        //                           ],
        //                           color: Colors.white,
        //                           borderRadius:
        //                               BorderRadius.all(Radius.circular(50))),
        //                       child: Icon(
        //                         Icons.not_listed_location_sharp,
        //                         size: 70,
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //         ListView.separated(
        //           shrinkWrap: true,
        //           physics: NeverScrollableScrollPhysics(),
        //           itemCount: foodList.length,
        //           separatorBuilder: (context, index) =>
        //               Divider(color: Colors.grey),
        //           itemBuilder: (context, index) {
        //             final foods = foodList[index];
        //             return InkWell(
        //               onTap: () {},
        //               child: Padding(
        //                 padding: const EdgeInsets.all(8.0),
        //                 child: Container(
        //                   width: 600,
        //                   height: 100,
        //                   color: const Color.fromARGB(0, 255, 255, 255),
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       Column(
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                         children: [
        //                           Text(
        //                               maxLines: 1,
        //                               foods.title.length > 30
        //                                   ? '${foods.title.substring(0, 30)}...'
        //                                   : foods.title),
        //                           Text(
        //                             foods.includeIngredients.isNotEmpty
        //                                 ? foods.includeIngredients
        //                                 : "Malzeme bilgisi yok",
        //                             style: GoogleFonts.abrilFatface(),
        //                           ),
        //                           Text(
        //                             ('${formatlaVirgulle(foods.price).toString()} TL'),
        //                             style: TextStyle(color: Colors.green),
        //                           ),
        //                         ],
        //                       ),
        //                       Stack(
        //                         children: [
        //                           Container(
        //                             height: 100,
        //                             width: 100,
        //                             decoration: BoxDecoration(
        //                               image: DecorationImage(
        //                                   image: NetworkImage(
        //                                     foods.image,
        //                                   ),
        //                                   fit: BoxFit.cover),
        //                               borderRadius: BorderRadius.circular(10),
        //                             ),
        //                           ),
        //                           Positioned(
        //                             top: 60,
        //                             left: 60,
        //                             child: InkWell(
        //                               onTap: () {},
        //                               child: Container(
        //                                 width: 40,
        //                                 height: 40,
        //                                 decoration: BoxDecoration(
        //                                     color: Colors.white,
        //                                     borderRadius:
        //                                         BorderRadius.circular(30)),
        //                                 child: Icon(Icons.add),
        //                               ),
        //                             ),
        //                           )
        //                         ],
        //                       )
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             );
        //           },
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}
