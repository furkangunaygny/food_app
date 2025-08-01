import 'package:flutter/material.dart';
import 'package:food_app/classes/theme_provider_class.dart';
import 'package:food_app/models/food_model.dart';
import 'package:food_app/models/theme_model.dart';
import 'package:food_app/pages/cart_page.dart';
import 'package:food_app/pages/food_page.dart';
import 'package:food_app/services/food_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../widgets/card_widget.dart';
import 'profile_page.dart';

// import 'package:food_app/models/restourants_model.dart';
// import 'package:food_app/services/restaurant_service.dart';
// import 'package:food_app/classes/food_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  late Future<List<Food>> restaurantFuture;
  @override
  void initState() {
    super.initState();
    restaurantFuture = fetchFoods(currentPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    //final screenWidth = MediaQuery.of(context).size.width;
    //final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppTheme.backColor,
      appBar: currentPageIndex == 0

          //AppBar

          ? AppBar(
              leading: IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  icon: Icon(
                    Icons.menu_outlined,
                    color: Colors.white,
                  )),
              backgroundColor: AppTheme.appColor,
              centerTitle: true,
              title: Text(
                "Food App",
                style: GoogleFonts.alexBrush(color: Colors.white),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CartPage()));
                    },
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ))
              ],
            )
          : null,
      body: IndexedStack(
        index: currentPageIndex,
        children: [
          //Food List

          FutureBuilder<List<Food>>(
            future: restaurantFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Hata: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("Hiç veri yok."));
              } else {
                return GridView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isPortrait ? 2 : 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 2 / 3),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final foodItem = snapshot.data![index];

//CardWidget Call

                      return CardWidget(
                        card: foodItem,
                        onTap: (selectedRestaurant) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FoodPage(
                                foodList: snapshot.data!,
                                food: selectedRestaurant,
                              ),
                            ),
                          );
                        },
                      );
                    });
              }
            },
          ),
          const ProfilePage(),
        ],
      ),

//BottomNavigationBar

      bottomNavigationBar: NavigationBar(
        height: 60,
        elevation: 10,
        shadowColor: Colors.black,
        backgroundColor: AppTheme.backColor,
        onDestinationSelected: (int index) {
          setState(
            () {
              currentPageIndex = index;
            },
          );
        },
        indicatorColor: AppTheme.iconColor,
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: AppTheme.backColor,
            ),
            icon: Icon(
              Icons.home_outlined,
              color: AppTheme.iconColor,
            ),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.person,
              color: AppTheme.backColor,
              fill: 1,
            ),
            icon: Icon(
              Icons.person_outlined,
              color: AppTheme.iconColor,
            ),
            label: '',
            //Profile
          ),
        ],
      ),

//Drawer

      drawer: Drawer(
        backgroundColor: AppTheme.backColor,
        elevation: 5,
        child: ListView(
          children: [
            DrawerHeader(
              child: Icon(
                Icons.food_bank,
                color: AppTheme.iconColor,
                size: 100,
              ),
            ),
            Switch(
                //activeTrackColor: ,
                thumbColor: (context.watch<ThemeProvider>().isDarkMode)
                    ? WidgetStatePropertyAll<Color>(Colors.black)
                    : WidgetStatePropertyAll<Color>(Colors.white),
                thumbIcon: (context.watch<ThemeProvider>().isDarkMode)
                    ? WidgetStatePropertyAll<Icon>(Icon(
                        Icons.nightlight_round_outlined,
                      ))
                    : WidgetStatePropertyAll<Icon>(Icon(
                        Icons.wb_sunny_outlined,
                        color: Colors.black,
                      )),
                value: context.watch<ThemeProvider>().isDarkMode,
                onChanged: (_) {
                  context.read<ThemeProvider>().toggleTheme();
                }),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.person_outline, color: AppTheme.iconColor),
              title: Text(
                'Profile',
                style: TextStyle(color: AppTheme.textColor),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.person_outline,
                color: AppTheme.iconColor,
              ),
              title: Text(
                'Profile',
                style: TextStyle(color: AppTheme.textColor),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.person_outline,
                color: AppTheme.iconColor,
              ),
              title: Text(
                'Profile',
                style: TextStyle(color: AppTheme.textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
