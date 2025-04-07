import 'package:HERMESCAFE/model/cafe.dart';
import 'package:flutter/material.dart';

class SuggestTile extends StatelessWidget {
  final Cafe cafe;
  final void Function()? onTap;
  const SuggestTile({super.key, required this.cafe, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(cafe.imagePath, height: 60),
          ),
        ),
        SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cafe.name,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'BMHANNA',
                ),
              ),
              Text(
                cafe.engname,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontFamily: 'BMHANNA',
                ),
              ),
              TextButton(
                onPressed: onTap,
                child: Transform.translate(
                  offset: Offset(-10, -10),
                  child: Text(
                    '주문하기',
                    style: TextStyle(
                      color: Color(0xfff37210),
                      fontSize: 14,
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
    );
  }
}
