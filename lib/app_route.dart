import 'package:flutter/material.dart';
import 'package:metarizz_assignment/pallete.dart';
import 'package:metarizz_assignment/screens/book_list.dart';
import 'package:metarizz_assignment/screens/search_screen.dart';
import 'package:provider/provider.dart';

class AppRoute extends StatefulWidget {
  const AppRoute({super.key});

  @override
  State<AppRoute> createState() => _AppRouteState();
}

class _AppRouteState extends State<AppRoute> {
  bool showSearchScreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 51,
        title: const Text(
          'Halal Food Search',
          style: TextStyle(color: Pallete.appBarColor),
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                child: Image.asset(
                  'assets/images/img_arrow_left_30x30.png',
                  width: 40,
                  height: 40,
                ),
              ),
              Positioned(
                child: IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Pallete.appBarColor,
                  ),
                  onPressed: () {
                    Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Pallete.drawerSelectedButtonBackgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              ),
              child: const Text(
                'Go to Search Screen',
                style: TextStyle(
                  color: Pallete.appBarColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20), // Add some space between the buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BookList()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Pallete.drawerSelectedButtonBackgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              ),
              child: const Text(
                'Go to Book List',
                style: TextStyle(
                  color: Pallete.appBarColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
