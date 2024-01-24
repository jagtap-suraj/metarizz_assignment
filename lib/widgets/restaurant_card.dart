import 'package:flutter/material.dart';
import 'package:metarizz_assignment/pallete.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key});

  @override
  Widget build(BuildContext context) {
    //mediaquery
    final mediaQuery = MediaQuery.of(context);
    return Card(
      elevation: 6,
      child: Container(
        width: mediaQuery.size.width * 0.7,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            colors: [
              Pallete.restaurantCardGradientColor,
              Pallete.darkBackgroundColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Restaurant Name",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Pallete.specialsNearYouColor),
            ),
            Text(
              "Location",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Pallete.specialsNearYouColor),
            ),
          ],
        ),
      ),
    );
  }
}

class BlankRestaurantCard extends StatelessWidget {
  const BlankRestaurantCard({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Column(
      children: [
        Card(
          elevation: 6,
          child: Container(
            width: mediaQuery.size.width * 0.7,
            height: 80,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [
                  Pallete.restaurantCardGradientColor,
                  Pallete.darkBackgroundColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Restaurant Name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Pallete.specialsNearYouColor),
              ),
              Text(
                "Location",
                style: TextStyle(fontSize: 10, color: Pallete.specialsNearYouColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
