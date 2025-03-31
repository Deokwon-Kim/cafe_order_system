import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0, right: 300),
            child: Text(
              'Order',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Divider(height: 1, color: Colors.grey),
          SizedBox(height: 50),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'espresso');
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset('lib/images/americano.jpg', height: 100),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'espresso');
                      },
                      child: Text(
                        '에스프레소',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -10),
                    child: Text(
                      'Espresso',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'coldbrew');
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset('lib/images/coldbrew.jpg', height: 100),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'coldbrew');
                      },
                      child: Text(
                        '콜드브루',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Transform.translate(
                      offset: Offset(0, -10),
                      child: Text(
                        'Cold Brew',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'frappuchino');
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'lib/images/frappuchino.jpg',
                      height: 100,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'frappuchino');
                      },
                      child: Text(
                        '프라푸치노',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Transform.translate(
                      offset: Offset(0, -10),
                      child: Text(
                        'Frappuchino',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'teabana');
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset('lib/images/tea.jpg', height: 100),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'teabana');
                      },
                      child: Text(
                        '티바나',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Transform.translate(
                      offset: Offset(0, -10),
                      child: Text(
                        'TeaBana',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
