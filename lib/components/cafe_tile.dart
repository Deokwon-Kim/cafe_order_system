import 'package:HERMESCAFE/model/cafe.dart';
import 'package:flutter/material.dart';

class CafeTile extends StatelessWidget {
  final Cafe cafe;
  final void Function()? onTap;
  const CafeTile({super.key, required this.cafe, this.onTap});

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
              child: Image.asset(cafe.imagePath, height: 95),
            ),
            SizedBox(width: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
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
                  Padding(
                    padding: const EdgeInsets.only(left: 13.0),
                    child: Transform.translate(
                      offset: Offset(0, -13),
                      child: Text(
                        cafe.engname,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontFamily: 'BMHANNA',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 13.0),
                    child: Transform.translate(
                      offset: Offset(0, -13),
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
            ),
          ],
        ),
      ),
    );
  }
}
