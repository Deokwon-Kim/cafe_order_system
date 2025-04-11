import 'package:HERMESCAFE/model/cafe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuggestTile extends StatelessWidget {
  final Cafe cafe;
  final void Function()? onTap;
  const SuggestTile({super.key, required this.cafe, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: onTap,
            child: Image.asset(cafe.imagePath, height: 150),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cafe.name,
              textAlign: TextAlign.start,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
