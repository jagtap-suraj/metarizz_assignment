import 'package:flutter/material.dart';
import 'package:metarizz_assignment/pallete.dart';
import 'package:metarizz_assignment/widgets/restaurant_card.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int itemCount = 12;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    int currentPage = 0;
    PageController pageController = PageController(
      initialPage: currentPage,
    );
    FocusNode myFocusNode = FocusNode();
    TextEditingController myController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 51,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Pallete.appBarColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
        body: SingleChildScrollView(
          child: SizedBox(
            height: mediaQuery.size.height * 0.9,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.location_on,
                        color: Pallete.locationColor,
                      ),
                      onPressed: () {},
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mumbai',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Pallete.locationColor),
                        ),
                        Text('India', style: TextStyle(fontWeight: FontWeight.bold, color: Pallete.locationColor)),
                      ],
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.keyboard_arrow_down, color: Pallete.locationColor),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    focusNode: myFocusNode,
                    controller: myController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      hintText: 'Search Food / Restaurants',
                      hintStyle: const TextStyle(color: Pallete.searchBoxTextColor),
                      fillColor: Pallete.searchBoxColor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          FocusScope.of(context).requestFocus(myFocusNode);
                        },
                        icon: const Icon(Icons.search),
                        color: Pallete.searchBoxTextColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  width: mediaQuery.size.width * 0.95,
                  height: mediaQuery.size.height * 0.05,
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text(
                    'Specials Near You',
                    style: TextStyle(
                      color: Pallete.specialsNearYouColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: mediaQuery.size.height * 0.2,
                        width: mediaQuery.size.width * 0.95,
                        child: PageView.builder(
                          controller: pageController,
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          onPageChanged: (value) {
                            setState(() {
                              currentPage = value;
                            });
                          },
                          itemBuilder: (context, index) {
                            return const RestaurantCard();
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: 5,
                          effect: const ColorTransitionEffect(activeDotColor: Pallete.specialsNearYouColor, dotHeight: 8, dotWidth: 8),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Text(
                        'Favourites',
                        style: TextStyle(
                          color: Pallete.limeTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          height: 1.0,
                          color: Pallete.limeTextColor,
                        ),
                      ),
                      Transform.rotate(
                        angle: 3.142 / 4,
                        child: const Icon(
                          Icons.stop,
                          color: Pallete.limeTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: LayoutBuilder(
                      builder: (context, constraints) => GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 20,
                          childAspectRatio: mediaQuery.size.width / (mediaQuery.size.height / 1.6),
                        ),
                        itemCount: 12,
                        itemBuilder: (context, index) {
                          return const BlankRestaurantCard();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            gradient: LinearGradient(
              colors: [
                Pallete.bottomNavigationBarGradientDarkColoe,
                Pallete.bottomNavigationBarGradientLightColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                itemCount += 12;
              });
            },
            child: const Center(
              child: Text(
                '+ more',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
