import 'package:flutter/material.dart';
import '../classes/card_class.dart';
import '../widgets/card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text("Food App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isPortrait ? 2 : 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: screenHeight * 0.45,
          ),
          itemCount: cardList.length,
          itemBuilder: (context, index) {
            final kutu = cardList[index];

            return CardWidget(
              card: kutu,
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
