import 'package:flutter/material.dart';
import 'package:metarizz_assignment/pallete.dart';
import 'package:provider/provider.dart';

class InformationCard extends StatelessWidget {
  final String title;
  final String value;
  const InformationCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: const TextStyle(
              color: Pallete.informationCardTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style:  TextStyle(
              color: Provider.of<ThemeNotifier>(context).getInformationCardTextColor(),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}