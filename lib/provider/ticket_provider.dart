import 'package:HERMESCAFE/model/cafe.dart';
import 'package:flutter/material.dart';

class TicketProvider extends ChangeNotifier {
  final Map<String, List<Cafe>> _ticketMenu = {
    'ticketPay': [
      Cafe(
        id: 'ticket_1만원권',
        name: '모바일 금액권 1만원 권',
        engname: 'Mobile Gift Card 10,000 KRW',
        discription: '모바일 금액권 1만원 권입니다. HERMES COFFEE에서 현금처럼 사용 가능합니다.',
        price: '10,000',
        imagePath: 'lib/images/Card.png',
      ),
      Cafe(
        id: 'ticket_2만원권',
        name: '모바일 금액권 2만원 권',
        engname: 'Mobile Gift Card 20,000 KRW',
        discription: '모바일 금액권 2만원 권입니다. HERMES COFFEE에서 현금처럼 사용 가능합니다.',
        price: '20,000',
        imagePath: 'lib/images/Card.png',
      ),
      Cafe(
        id: 'ticket_3만원권',
        name: '모바일 금액권 3만원 권',
        engname: 'Mobile Gift Card 30,000 KRW',
        discription: '모바일 금액권 3만원 권입니다. HERMES COFFEE에서 현금처럼 사용 가능합니다.',
        price: '30,000',
        imagePath: 'lib/images/Card.png',
      ),
      Cafe(
        id: 'ticket_4만원권',
        name: '모바일 금액권 4만원 권',
        engname: 'Mobile Gift Card 40,000 KRW',
        discription: '모바일 금액권 4만원 권입니다. HERMES COFFEE에서 현금처럼 사용 가능합니다.',
        price: '40,000',
        imagePath: 'lib/images/Card.png',
      ),
      Cafe(
        id: 'ticket_5만원권',
        name: '모바일 금액권 5만원 권',
        engname: 'Mobile Gift Card 50,000 KRW',
        discription: '모바일 금액권 5만원 권입니다. HERMES COFFEE에서 현금처럼 사용 가능합니다.',
        price: '50,000',
        imagePath: 'lib/images/Card.png',
      ),
    ],
  };

  Cafe? _selectedCafe;

  List<Cafe> getTicketMenu(String category) {
    return _ticketMenu[category] ?? [];
  }

  // 현재 선택된 카페 아이템 가져오기
  Cafe? get selectedCafe => _selectedCafe;

  // 카페 아이템 선택하기
  void selectCafe(Cafe cafe) {
    _selectedCafe = cafe;
    notifyListeners(); // 리스너들에게 상태 변경 알림
  }

  // 선택된 카페 아이템 초기화
  void clearSelectedCafe() {
    _selectedCafe = null;
    notifyListeners();
  }
}
