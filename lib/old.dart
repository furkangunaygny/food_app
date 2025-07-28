/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../classes/food_class.dart';
import '../widgets/card_widget.dart';
import 'profile_page.dart';
import 'package:food_app/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  int iconIndex = 0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final List<Widget> pages = [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: screenHeight * 0.1,
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            color: const Color.fromARGB(64, 0, 0, 0),
            height: 0.1,
            indent: 0.2,
            endIndent: 0.8,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                'Most Preferred',
                style: GoogleFonts.agbalumo(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
          CardWidget(cardList: foodList, onTap: () {}),
          SizedBox(
            height: 16,
          ),
          Divider(
            color: const Color.fromARGB(64, 0, 0, 0),
            height: 0.1,
            indent: 0.2,
            endIndent: 0.8,
          ),
        ],
      ),
      const ProfilePage(),
    ];
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: backColor,
      appBar: currentPageIndex == 0
          ? AppBar(
              backgroundColor: Colors.red,
              centerTitle: true,
              title: Text(
                "Food App",
                style: GoogleFonts.alexBrush(color: titleColor),
              ),
            )
          : null,
      body: pages[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        elevation: 10,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        onDestinationSelected: (int index) {
          setState(
            () {
              currentPageIndex = index;
            },
          );
        },
        indicatorColor: Colors.white,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: Colors.amber,
            ),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person, color: Colors.amber),
            icon: Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        elevation: 5,
        child: ListView(
          children: [
            const DrawerHeader(
              child: Icon(
                Icons.food_bank,
                size: 100,
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.person_outline),
              title: const Text('Profile'),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.person_outline),
              title: const Text('Profile'),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.person_outline),
              title: const Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
*/
/*import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.cardList, required this.onTap});
  final List cardList;
  final VoidCallback onTap;
  final Axis axis = Axis.horizontal;

  String formatPrice(double price) {
    final formatter = NumberFormat("#,##0.00", "en_US");
    return formatter.format(price);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.3,
      child: GridView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          scrollDirection: axis,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: screenWidth * 0.8,
          ),
          itemCount: cardList.length,
          itemBuilder: (context, index) {
            final card = cardList[index];

            return InkWell(
              onTap: onTap,
              child: Column(
                children: [
                  //Image Conrainer
                  Container(
                    height: screenHeight * 0.2,
                    width: screenWidth * 0.8,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: BorderSide.strokeAlignOutside,
                              blurStyle: BlurStyle.outer)
                        ],
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16)),
                        image: DecorationImage(
                            image: AssetImage(card.assetImage),
                            fit: BoxFit.cover)),
                  ),
                  //Explanation Container
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
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
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //Restaurant Information
                                Text(
                                  card.title.length > 16
                                      ? '${card.title.substring(0, 16)}...'
                                      : card.title,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: textColor,
                                      fontStyle: FontStyle.normal),
                                  textAlign: TextAlign.center,
                                ),
                                //Rating Information
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.yellow, size: 18),
                                    const SizedBox(width: 4),
                                    Text(
                                      card.rating.toString(),
                                      style: TextStyle(color: textColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            //Price İnformation
                            Row(
                              children: [
                                const Icon(Icons.motorcycle_outlined),
                                Text(
                                  'Ücretsiz Teslimat',
                                  style: GoogleFonts.abel(),
                                )
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
                                  "${formatPrice(card.price)} ₺",
                                  style: TextStyle(color: textColor),
                                ),
                                const SizedBox(height: 4),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
 */