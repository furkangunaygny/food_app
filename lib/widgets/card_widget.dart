import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';
import 'package:food_app/models/food_model.dart';
import 'package:food_app/models/restourants_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.cardList, required this.onTap});
  final List<Food> cardList;
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
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isPortrait ? 2 : 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2 / 3),
        itemCount: cardList.length,
        itemBuilder: (context, index) {
          final card = cardList[index];

          return InkWell(
            onTap: () => onTap(card),
            child: Column(
              children: [
                //Image Conrainer
                Flexible(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: BorderSide.strokeAlignOutside,
                              blurStyle: BlurStyle.outer)
                        ],
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16)),
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
                              blurStyle: BlurStyle.outer)
                        ],
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(16)),
                        color: explanationContainerColor,
                      ),
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
                                  card.title.length > 16
                                      ? '${card.title.substring(0, 16)}...'
                                      : card.title,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: textColor,
                                      fontStyle: FontStyle.normal),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              //Rating Information
                              Flexible(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Text(
                                      overflow: TextOverflow.ellipsis,
                                      formatlaOndalik(card.rating).toString(),
                                      style: TextStyle(color: textColor),
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
                              Text(' - ${(card.maxReadyTime)}' ,style:GoogleFonts.alumniSansCollegiateOne() ,)
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.attach_money,
                                color: Colors.green,
                              ),
                              Text(
                                "${(formatlaVirgulle(card.price))} ₺",
                                style: TextStyle(color: textColor),
                              ),
                              const SizedBox(height: 4),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
