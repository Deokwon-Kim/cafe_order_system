import 'package:HERMESCAFE/model/cafe.dart';
import 'package:flutter/material.dart';

class DesertViewmodel extends ChangeNotifier {
  final Map<String, List<Cafe>> _cafeDesertMenu = {
    'cake': [
      Cafe(
        id: 'cake1',
        name: '부드러운 쑥 팥 생크림롤',
        engname: 'Mugwort Red Bean Cream Roll Cake',
        discription:
            '싱그러운 봄과 어울리는 국내산 쑥으로 만든\n쑥 크림과 달콤한 단팥 생크림이 더해진 케이크에\n여수 거문도 해풍 쑥으로 만든\n초콜릿을 올린 롤 케이크입니다.',
        price: '7,900',
        imagePath: 'lib/images/cake/Mugwor_RedBean_Roll_Cake.jpg',
      ),
      Cafe(
        id: 'cake2',
        name: '딸기 마스카포네 샌드 케이크',
        engname: 'Strawberry Mascarpone Sand Cake',
        discription:
            '봄의 분위기를 표현한 색감의 카스텔라 시트\n사이에 생딸기와 바닐라빈을 담은 마스카포네\n슈크림을 샌드한 케이크입니다.',
        price: '4,700',
        imagePath: 'lib/images/cake/Strawberry_Sand_Cake.jpg',
      ),
      Cafe(
        id: 'cake3',
        name: '딸기 촉촉 초코 생크림 케이크',
        engname: 'Strawberry Choco Cream Cake',
        discription:
            '촉촉한 초코 카스텔라 안에 달콤한 가나슈\n생크림을 듬뿍 담은 뒤 우유 생크림과 딸기로\n상단에 토핑을 한 케이크입니다.',
        price: '8,300',
        imagePath: 'lib/images/cake/Strawberry Choco Cream Cake.jpg',
      ),
      Cafe(
        id: 'cake4',
        name: '딸기 초코 생크림 케이크',
        engname: 'Strawberry Choco Fresh Cream Cake',
        discription:
            '달콤한 초코 시트와 핑크 시트 사이에 부드러운\n생크림과 국내산 생딸기가 샌드된\n클래식한 매력의 케이크입니다.',
        price: '7,300',
        imagePath: 'lib/images/cake/Strawberry_Choco_Fresh_Cream_Cake.jpg',
      ),
      Cafe(
        id: 'cake5',
        name: '초코 품은 부생카',
        engname: 'Choco Fresh Cream Castella',
        discription:
            '초코가 더해진 촉촉한 투톤 컬러의 카스텔라에\n부드러운 생크림, 초코 생크림 두 가지 매력을\n한번에 즐길 수 있어 더욱 매력적인\n부생카입니다.',
        price: '5,500',
        imagePath: 'lib/images/cake/Choco Fresh Cream Castella.jpg',
      ),
      Cafe(
        id: 'cake6',
        name: '고구마 카스텔라 생크림 케이크',
        engname: 'Sweet Potato Castella Cream Cake',
        discription:
            '부드러운 고구마 무스 사이에 고구마 다이스로\n고구마 풍미를 가득 담아 생크림을 샌드하고\n카스텔라 가루를 듬뿍 올린 달콤하고\n고소한 케이크입니다.',
        price: '7,100',
        imagePath: 'lib/images/cake/Sweet_Potato_Castella_Cream_Cake.jpg',
      ),
      Cafe(
        id: 'cake7',
        name: '레이디핑거 티라미수 케이크',
        engname: 'Ladyfinger Tiramisu Cake',
        discription:
            '진한 풍미의 마스카포네 치즈 크림 사이에\n커피 시럽으로 촉촉하게 적신 레이디핑거 쿠키가\n샌드되어 부드럽게 어우러지는 케이크입니다.',
        price: '6,900',
        imagePath: 'lib/images/cake/Ladyfinger Tiramisu Cake.jpg',
      ),
      Cafe(
        id: 'cake8',
        name: '진한 가나슈 9 레이어 케이크',
        engname: 'Ganache 9 Layer Cake',
        discription:
            '다크벨벳, 화이트, 브라운 시트 사이에\n다크 가나슈, 밀크 가나슈, 초코 크림, 카라멜 크림이\n샌드 되어 9겹의 층을 이루는 진한 초코 풍미가\n가득 느껴지는 케이크 입니다.',
        price: '6,900',
        imagePath: 'lib/images/cake/Ganache 9 Layer Cake.jpg',
      ),
      Cafe(
        id: 'cake9',
        name: '블루베리 마블 치즈 케이크',
        engname: 'Blueberry Marble Cheese Cake',
        discription:
            '촉촉한 블루베리가 콕콕 박힌 진한 풍미의\n치즈 케이크로 달콤 상큼한 블루베리가 조화롭게\n어우러지는 치즈 케이크입니다.',
        price: '7,300',
        imagePath: 'lib/images/cake/Blueberry Marble Cheese Cake.jpg',
      ),
      Cafe(
        id: 'cake10',
        name: '바스크 초코 치즈 케이크',
        engname: 'Basque Choco Cheese Cake',
        discription:
            '고온에서 짧게 구워 겉면은 스모키하고 속은\n크리미한 특징의 바스크 치즈 케이크에 초코의\n달콤한 풍미를 더해 다채로운 맛을\n즐길 수 있는 케이크입니다.',
        price: '7,300',
        imagePath: 'lib/images/cake/Basque Choco Cheese Cake.jpg',
      ),
      Cafe(
        id: 'cake11',
        name: '부드러운 흑임자 롤',
        engname: 'Black Sesame Roll',
        discription:
            '국내산 흑임자를 사용한 고소한 흑임자 시트\n사이에 흑임자 크림을 듬뿍 샌드 한\n부드러운 롤 케이크입니다.',
        price: '7,500',
        imagePath: 'lib/images/cake/Black Sesame Roll.jpg',
      ),
      Cafe(
        id: 'cake12',
        name: '생크림 크레이프 롤',
        engname: 'Fresh Cream Crepe Rolls',
        discription:
            '얇게 구워낸 크레이프에 달콤하고 고소한\n커스터드 생크림을 얇게 발라 겹겹이 쌓은 후\n돌돌 말아낸 크레이프 롤 케이크입니다.',
        price: '7,500',
        imagePath: 'lib/images/cake/Fresh Cream Crepe Rolls.jpg',
      ),
      Cafe(
        id: 'cake13',
        name: '스틱 에그 타르트',
        engname: 'Stick Egg Tart',
        discription: '간편하게 즐길 수 있는 얇고 길쭉한 형태의\n달콤하고 고소한 맛의 에그 타르트입니다.',
        price: '4,600',
        imagePath: 'lib/images/cake/Stick Egg Tart.jpg',
      ),
      Cafe(
        id: 'cake14',
        name: '부드러운 생크림 카스텔라',
        engname: 'Fresh Cream Castella',
        discription: '부드러운 생크림이 듬뿍 들어있는\n촉촉한 카스텔라입니다.',
        price: '4,500',
        imagePath: 'lib/images/cake/Fresh Cream Castella.jpg',
      ),
      Cafe(
        id: 'cake15',
        name: '라즈베리 쇼콜라',
        engname: 'Raspberry chocolate Cake',
        discription:
            '초콜릿 케이크 사이에 진한 가나슈 필링을\n넣은 후 라즈베리를 올린 진하고\n묵직한 초콜릿 케이크입니다.',
        price: '5,900',
        imagePath: 'lib/images/cake/Raspberry chocolate Cake.jpg',
      ),
    ],
    'icecream': [
      Cafe(
        id: 'icecream1',
        name: '딸기 요거트 젤라또',
        engname: 'Strawberry Yogurt Gelato',
        discription: '산뜻한 요거트 맛과 달콤한\n딸기 맛이 어우러진 젤라또입니다.',
        price: '5,600',
        imagePath: 'lib/images/icecream/Strawberry Yogurt Gelato.jpg',
      ),
      Cafe(
        id: 'icecream2',
        name: '바닐라 빈 젤라또',
        engname: 'Vanilla Bean Gelato',
        discription: '마다가스카르산 바닐라 빈이 들어있는\n부드럽고 깔끔한 맛의 젤라또입니다.',
        price: '5,300',
        imagePath: 'lib/images/icecream/Vanilla Bean Gelato.jpg',
      ),
      Cafe(
        id: 'icecream3',
        name: '요거트 젤라또',
        engname: 'Yogurt Gelato',
        discription: '산뜻한 요거트 맛이 느껴지는 젤라또입니다.',
        price: '4,800',
        imagePath: 'lib/images/icecream/Yogurt Gelato.jpg',
      ),
      Cafe(
        id: 'icecream4',
        name: '파베 초콜릿 젤라또',
        engname: 'Pave Chocolate Gelato',
        discription: '쫀득한 식감의 파베 초콜릿이 들어있는\n달콤한 맛의 초콜릿 젤라또입니다.',
        price: '5,300',
        imagePath: 'lib/images/icecream/Pave Chocolate Gelato.jpg',
      ),
      Cafe(
        id: 'icecream5',
        name: '피스타치오 젤라또',
        engname: 'Pistachio Gelato',
        discription: '고소한 피스타치오 맛이 느껴지는 젤라또입니다.',
        price: '5,300',
        imagePath: 'lib/images/icecream/Pistachio Gelato.jpg',
      ),
    ],
  };
  Cafe? _selectedCafe;

  List<Cafe> getDesertMenu(String category) {
    return _cafeDesertMenu[category] ?? [];
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
