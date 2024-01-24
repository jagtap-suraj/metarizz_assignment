import 'package:flutter/material.dart';
import 'package:metarizz_assignment/pallete.dart';

class BookSelection extends StatelessWidget {
  final String bookName;
  final bool isSelected;
  const BookSelection({super.key, required this.bookName, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(
      bookName,
      style: TextStyle(
        color: isSelected ? Pallete.drawerSelectedTextColor : Pallete.drawerTextColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
