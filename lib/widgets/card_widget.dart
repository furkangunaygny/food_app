import 'package:flutter/material.dart';
import 'package:food_app/models/food_model.dart';
import 'package:food_app/models/theme_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
// import 'package:food_app/models/restourants_model.dart';

///
///
///API dan gelen verileri alıp sayfada görüntüleyen widget
///
///
///
///

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.card, required this.onTap});
  final Food card;
  final void Function(Food) onTap;

  String cleanImageUrl(String url) {
    return url.split('?').first;
  }

  String formatlaVirgulle(num sayi) {
    final formatter = NumberFormat("#,##0.##", "en_US");
    return formatter.format(sayi);
  }

  String formatlaOndalik(num sayi) {
    final formatter = NumberFormat("0.0", "en_US");
    return formatter.format(sayi);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(card),
      child: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: BorderSide.strokeAlignOutside,
                        blurStyle: BlurStyle.outer,
                        color: AppTheme.iconColor)
                  ],
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                  image: DecorationImage(
                    image: NetworkImage(cleanImageUrl(card.image)),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          //Explanation Container
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: BorderSide.strokeAlignOutside,
                        blurStyle: BlurStyle.outer,
                        color: AppTheme.iconColor)
                  ],
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(16)),
                  color: AppTheme.explanationContainerColor,
                ),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Restaurant Information
                          Flexible(
                            child: Text(
                              maxLines: 1,
                              card.title.length > 17
                                  ? '${card.title.substring(0, 17)}...'
                                  : card.title,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: AppTheme.textColor,
                                  fontStyle: FontStyle.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          //Rating Information
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  formatlaOndalik(card.rating).toString(),
                                  style: TextStyle(color: AppTheme.textColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      //Price İnformation
                      Row(
                        children: [
                          const Icon(
                            Icons.motorcycle,
                            color: Colors.green,
                          ),
                          Text(
                            'xx Teslimat',
                            style: GoogleFonts.abel(color: Colors.green),
                          ),
                          Text(
                            ' - ${(card.readyInMinutes)}dk',
                            style: GoogleFonts.abel(),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
