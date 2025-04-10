import 'package:HERMESCAFE/model/cafe.dart';
import 'package:flutter/material.dart';

class GiftcardTile extends StatelessWidget {
  final Cafe cafe;
  final void Function()? onTap;
  const GiftcardTile({super.key, required this.cafe, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(cafe.imagePath, height: 75),
            ),
            SizedBox(width: 20),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: onTap,
                  child: Text(
                    cafe.name,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'BMHANNA',
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(13, -13),
                  child: Text(
                    cafe.engname,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontFamily: 'BMHANNA',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Transform.translate(
                    offset: Offset(5, -13),
                    child: Text(
                      '${cafe.price}원',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'BMHANNA',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
