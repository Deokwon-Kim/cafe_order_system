import 'package:HERMESCAFE/model/cafe.dart';
import 'package:flutter/material.dart';

class SuggestMenuProvider extends ChangeNotifier {
  final Map<String, List<Cafe>> _suggestMenu = {
    'suggest': [
      Cafe(
        id: 'suggest1',
        name: '카페 아메리카노',
        engname: 'Caffe Americano',
        discription:
            '진한 에스프레소와 뜨거운 물을 섞어 깔끔하고 \n강렬한 에스프레소를 가장 부드럽게\n잘 느낄 수 있는 커피',
        price: '4,500',
        imagePath: 'lib/images/espresso/HotAmericano.jpg',
      ),
      Cafe(
        id: 'suggest2',
        name: '자바칩 프라푸치노',
        engname: 'Java Chip Frappuccino',
        discription: '커피, 모카 소스, 진한 초콜릿\n 칩이 입안 가득 느껴지는 프라푸치노',
        price: '6,500',
        imagePath: 'lib/images/frappuchino/Java_Chip.jpg',
        temperatureOption: 'iceonly',
      ),
      Cafe(
        id: 'suggest3',
        name: '슈크림 라떼',
        engname: 'Choux Cream Latte',
        discription:
            '우리가 봄을 기다리는 이유!\n봄 하면 떠오르는 노란색 슈크림과 에스프레소의\n완벽한 조화가 돋보이는 음료입니다.',
        price: '6,500',
        imagePath: 'lib/images/espresso/ChouxCreamLatte.jpg',
      ),
      Cafe(
        id: 'suggest4',
        name: '바닐라 빈 라떼',
        engname: 'Vanilla Bean Latte',
        discription: '바닐라 빈 시럽이 부드럽게 어우러진 카페 라떼',
        price: '7,000',
        imagePath: 'lib/images/espresso/Vanilla Bean Latte.jpg',
      ),
      Cafe(
        id: 'suggest5',
        name: '카페 라떼',
        engname: 'Caffe Latte',
        discription:
            '풍부하고 진한 에스프레소가 신선한 스팀 밀크를 만나\n부드러워진 커피 위에 우유 거품을 살짝 얹은\n대표적인 커피 라떼',
        price: '5,000',
        imagePath: 'lib/images/espresso/HotCafeLatte.jpg',
      ),
      Cafe(
        id: 'suggest6',
        name: '자몽 허니 블랙 티',
        engname: 'Grepefruit Honey Black Tea',
        discription: '새콤한 자몽과 달콤한 꿀이 깊고 그윽한 풍미의\n스타벅스 티바나 블랙 티의 조화',
        price: '5,900',
        imagePath: 'lib/images/tea/Honey_Black_Tea.jpg',
      ),
    ],
    'icedsuggest': [
      Cafe(
        id: 'icedsuggest1',
        name: '아이스 카페 아메리카노',
        engname: 'Iced Caffe Americano',
        discription:
            '진한 에스프레소와 뜨거운 물을 섞어 깔끔하고 \n강렬한 에스프레소를 가장 부드럽게\n잘 느낄 수 있는 커피',
        price: '4,500',
        imagePath: 'lib/images/espresso/iceAmericano.jpg',
      ),
      Cafe(
        id: 'icedsuggest2',
        name: '자바칩 프라푸치노',
        engname: 'Java Chip Frappuccino',
        discription: '커피, 모카 소스, 진한 초콜릿\n칩이 입안 가득 느껴지는 프라푸치노',
        price: '6,500',
        imagePath: 'lib/images/frappuchino/Java_Chip.jpg',
        temperatureOption: 'iceonly',
      ),

      Cafe(
        id: 'icedsuggest3',
        name: '아이스 슈크림 라떼',
        engname: 'Iced Choux Cream Latte',
        discription:
            '우리가 봄을 기다리는 이유!\n봄 하면 떠오르는 노란색 슈크림과 에스프레소의\n완벽한 조화가 돋보이는 음료입니다.',
        price: '6,500',
        imagePath: 'lib/images/espresso/IcedChouxCreamLatte.jpg',
      ),
      Cafe(
        id: 'icedsuggest4',
        name: '아이스 바닐라 빈 라떼',
        engname: 'Iced Vanilla Bean Latte',
        discription: '바닐라 빈 시럽이 부드럽게 어우러진 카페 라떼',
        price: '7,000',
        imagePath: 'lib/images/espresso/Iced Vanilla Bean Latte.jpg',
      ),
      Cafe(
        id: 'icedsuggest5',
        name: '아이스 카페 라떼',
        engname: 'Iced Caffe Latte',
        discription:
            '풍부하고 진한 에스프레소가 신선한 스팀 밀크를 만나\n부드러워진 커피 위에 우유 거품을 살짝 얹은\n대표적인 커피 라떼',
        price: '5,000',
        imagePath: 'lib/images/espresso/IcedCafeLatte.jpg',
      ),
      Cafe(
        id: 'icedsuggest6',
        name: '아이스 자몽 허니 블랙 티',
        engname: 'Iced Grepefruit Honey Black Tea',
        discription: '새콤한 자몽과 달콤한 꿀이 깊고 그윽한 풍미의\n스타벅스 티바나 블랙 티의 조화',
        price: '5,900',
        imagePath: 'lib/images/tea/IcedBlackTea.jpg',
      ),
    ],
  };

  // 선택된 카페 아이템을 저장하는 변수
  Cafe? _selectedCafe;

  // 특정 카테고리의 리스트 가져오기
  List<Cafe> getSuggestMenu(String category) {
    return _suggestMenu[category] ?? [];
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

  List<Cafe> getIceMenu(String category) {
    return _suggestMenu[category] ?? [];
  }
}
