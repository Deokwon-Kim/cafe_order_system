import 'package:HERMESCAFE/components/cafe_tile.dart';
import 'package:HERMESCAFE/pages/detail_page/ticket_detail_page.dart';
import 'package:HERMESCAFE/provider/ticket_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ticket = Provider.of<TicketProvider>(
      context,
    ).getTicketMenu('ticketPay');
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            expandedHeight: 70,
            floating: false,
            pinned: true,
            scrolledUnderElevation: 4.0,
            shadowColor: const Color.fromARGB(91, 158, 158, 158),
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                // 스크롤 상태에 따라 타이틀을 보이게 설정
                double percent =
                    (constraints.maxHeight - kToolbarHeight) /
                    (200 - kToolbarHeight);
                bool showTitle = percent < 0.5; // 절반 이상 스크롤 되면 보이게 처리

                return FlexibleSpaceBar(
                  title:
                      showTitle
                          ? Text(
                            '금액권',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: 'BMJUA',
                            ),
                          )
                          : null,
                );
              },
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                '금액권',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'BMHANA',
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return CafeTile(
                cafe: ticket[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              TicketDetailPage(cafeMenu: ticket[index]),
                    ),
                  );
                },
              );
            }, childCount: ticket.length),
          ),
        ],
      ),
    );
  }
}
