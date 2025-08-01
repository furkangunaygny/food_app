import 'package:flutter/material.dart';
import 'package:food_app/models/cart_model.dart';
import 'package:food_app/models/theme_model.dart';
import 'package:food_app/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

///
///
///CartPage
///
///Uygulamanın Sipariş Sayfası
///
///
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      backgroundColor: AppTheme.backColor,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            },
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white)),
        title: Text(
          'Sepet',
          style: GoogleFonts.eduNswActFoundation(
              color: Colors.white, fontSize: 30),
        ),
        backgroundColor: AppTheme.appColor,
      ),
      body: cart.items.isEmpty
          ? Center(
              child: Text(
              'Sepetiniz boş',
              style: TextStyle(color: AppTheme.textColor),
            ))

          //Ürün Listelemek için ListView.builder

          : ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final entry = cart.items.entries.toList()[index];
                final food = entry.key;
                final count = entry.value;
                return ListTile(
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              food.image,
                            )),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.6),
                              offset: Offset(0, 0),
                              blurRadius: BorderSide.strokeAlignOutside,
                              spreadRadius: 1)
                        ]),
                  ),
                  title: Text(
                    overflow: TextOverflow.ellipsis,
                    food.title,
                    style: TextStyle(color: AppTheme.textColor),
                  ),
                  subtitle: Text(
                    '${(food.price * count).toStringAsFixed(2)} TL',
                    style: TextStyle(color: AppTheme.textColor),
                  ),
                  trailing: Card(
                    color: Colors.white,
                    elevation: 4,
                    margin: EdgeInsets.all(3),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: AppTheme.iconColor,
                          ),
                          onPressed: () => cart.removeOneFromCart(food),
                        ),
                        Text(
                          '${count}',
                          style: TextStyle(
                              color: AppTheme.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        IconButton(
                            onPressed: () => cart.addToCart(food),
                            icon: Icon(Icons.add, color: AppTheme.iconColor))
                      ],
                    ),
                  ),
                );
              },
            ),

      //Ürünlerin Toplam değeri
      //Sipariş Butonu

      bottomNavigationBar: cart.items.isNotEmpty
          ? BottomAppBar(
              
              height: 110,
              elevation: 10,
              shadowColor: Colors.white,
              color: AppTheme.backColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Ürünlerin Toplam değeri

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Toplam ',
                        style: GoogleFonts.rubik(
                            color: AppTheme.textColor, fontSize: 20),
                      ),
                      Text(
                        '${cart.totalPrice.toStringAsFixed(2)} TL',
                        style:
                            TextStyle(color: AppTheme.textColor, fontSize: 20),
                      )
                    ],
                  ),

                  //Sipariş Butonu

                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.all(5),
                        width: 400,
                        height: 100,
                        decoration: BoxDecoration(
                          color: AppTheme.appColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sepeti Onayla',
                              style: GoogleFonts.rubik(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          : null,
    );
  }
}
