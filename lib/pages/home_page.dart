import 'package:flutter/material.dart';
import 'package:food_app/pages/food_page.dart';
import 'package:food_app/services/food_service.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/food_model.dart';
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
  late Future<List<Recipe>> recipeFuture;
  @override
  void initState() {
    super.initState();
    recipeFuture = fetchFoods();
  }

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    //final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
      body: IndexedStack(
        index: currentPageIndex,
        children: [
          FutureBuilder<List<Recipe>>(
            future: recipeFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Hata: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("Hiç veri yok."));
              } else {
                return CardWidget(
                  cardList: snapshot.data!,
                  onTap: (selectedRecipe) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodPage(recipe: selectedRecipe),
                      ),
                    );
                  },
                );
              }
            },
          ),
          const ProfilePage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        height: 70,
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
