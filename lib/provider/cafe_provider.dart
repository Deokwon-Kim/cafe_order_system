import 'package:HERMESCAFE/model/cafe.dart';
import 'package:flutter/material.dart';

class CafeViewmodel extends ChangeNotifier {
  // 각 디테일 페이지의 리스트를 관리하는 Map
  final Map<String, List<Cafe>> _cafeMenu = {
    'espresso': [
      Cafe(
        id: 'espresso1',
        name: '슈크림 라떼',
        engname: 'Choux Cream Latte',
        discription:
            '우리가 봄을 기다리는 이유!\n봄 하면 떠오르는 노란색 슈크림과 에스프레소의\n완벽한 조화가 돋보이는 음료입니다.',
        price: '6,500',
        imagePath: 'lib/images/espresso/ChouxCreamLatte.jpg',
      ),
      Cafe(
        id: 'espresso2',
        name: '플랫 화이트',
        engname: 'Flat White',
        discription:
            '부드러운 리스트레토 샷과 완벽한 양의 스팀밀크를 더해,\n카페라떼 보다 커피의 맛을 진하게 즐길 수 있는\n에스프레소 음료입니다.',
        price: '5,800',
        imagePath: 'lib/images/espresso/Flat_White.jpg',
      ),
      Cafe(
        id: 'espresso3',
        name: '카페 아메리카노',
        engname: 'Caffe Americano',
        discription:
            '진한 에스프레소와 뜨거운 물을 섞어 깔끔하고 \n강렬한 에스프레소를 가장 부드럽게\n잘 느낄 수 있는 커피',
        price: '4,500',
        imagePath: 'lib/images/espresso/HotAmericano.jpg',
      ),
      Cafe(
        id: 'espresso4',
        name: '카페 라떼',
        engname: 'Caffe Latte',
        discription:
            '풍부하고 진한 에스프레소가 신선한 스팀 밀크를 만나\n부드러워진 커피 위에 우유 거품을 살짝 얹은\n대표적인 커피 라떼',
        price: '5,000',
        imagePath: 'lib/images/espresso/HotCafeLatte.jpg',
      ),
      Cafe(
        id: 'espresso5',
        name: '돌체 라떼',
        engname: 'Dolce Latte',
        discription:
            '다른 커피 음료보다 더욱 깊은 커피의 맛과 향에\n깔끔한 무지방 우유와 부드러운 돌체 시럽이 들어간\n음료로 달콤하고 진한 커피 라떼',
        price: '6,100',
        imagePath: 'lib/images/espresso/DolceLatte.jpg',
      ),
      Cafe(
        id: 'espresso6',
        name: '카페 모카',
        engname: 'Caffe Mocha',
        discription:
            '진한 초콜릿 모카 시럽과 풍부한 에스프레소를\n스팀밀크 와 섞어 휘핑크림으로 마무리한 음료로\n진한 에스프레소와 초콜릿 맛이 어우러진 커피',
        price: '5,500',
        imagePath: 'lib/images/espresso/HotCafeMocha.jpg',
      ),
      Cafe(
        id: 'espresso7',
        name: '카푸치노',
        engname: 'Cappuccino',
        discription:
            '풍부하고 진한 에스프레소에 따뜻한 우유와 벨벳 같은\n우유거품이 1:1 비율로 어우러져 마무리된\n커피 음료',
        price: '5,200',
        imagePath: 'lib/images/espresso/Cappuchino.jpg',
      ),
      Cafe(
        id: 'espresso8',
        name: '카라멜 마키아또',
        engname: 'Caramel Macchiato',
        discription: '에스프레소에 거품을 낸 우유를 붓고\n카라멜  시럽을 얹은 커피',
        price: '6,100',
        imagePath: 'lib/images/espresso/Caramel Macchiato.jpg',
      ),
      Cafe(
        id: 'espresso9',
        name: '화이트 초콜릿 모카',
        engname: 'White Chocolate Mocha',
        discription:
            '달콤하고 부드러운 화이트 초콜릿 시럽과 에스프레소를\n스팀 밀크와 섞어 휘핑크림으로 마무리한 음료로\n달콤함과 강렬한 에스프레소가\n부드럽게 어우러진 커피',
        price: '6,100',
        imagePath: 'lib/images/espresso/White Chocolate Mocha.jpg',
      ),
      Cafe(
        id: 'espresso10',
        name: '바닐라 빈 라떼',
        engname: 'Vanilla Bean Latte',
        discription: '바닐라 빈 시럽이 부드럽게 어우러진 카페 라떼',
        price: '7,000',
        imagePath: 'lib/images/espresso/Vanilla Bean Latte.jpg',
      ),
      Cafe(
        id: 'espresso11',
        name: '에스프레소',
        engname: 'Espresso',
        discription:
            '향기로운 크레마 층과 바디 층, 하트 층으로\n이루어져 있으며, 입안 가득히 커피와 달콤한\n카라멜 향이 느껴지는 커피 음료',
        price: '3,900',
        imagePath: 'lib/images/espresso/Espresso.jpg',
        temperatureOption: 'hotonly',
      ),
      Cafe(
        id: 'espresso12',
        name: '에스프레소 마키아또',
        engname: 'Espresso Macchiato',
        discription:
            '신선한 에스프레소 샷에 우유 거품을 살짝 얹은\n커피 음료로, 강렬한 에스프레소의 맛과 우유의\n부드러움을 같이 즐길 수 있는 커피 음료',
        price: '3,900',
        imagePath: 'lib/images/espresso/espressomakiatto.jpg',
        temperatureOption: 'hotonly',
      ),
      Cafe(
        id: 'espresso13',
        name: '에스프레소 콘 파나',
        engname: 'Espresso Con Panna',
        discription:
            '신선한 에스프레소 샷에 풍부한 휘핑크림을 얹은\n커피 음료로서, 뜨거운 커피의 맛과 차갑고 달콤한\n생크림의 맛을 같이 즐길 수 있는 커피 음료',
        price: '4,100',
        imagePath: 'lib/images/espresso/espressocon.jpg',
        temperatureOption: 'hotonly',
      ),
    ],

    'coldbrew': [
      Cafe(
        id: 'coldbrew1',
        name: '콜드 브루',
        engname: 'Cold Brew',
        discription:
            '콜드 브루 전용 원두를 차가운 물로 추출하여\n한정된 양만 제공 됩니다. 깊은 풍미의 새로운 커피\n경험을 즐겨보세요.',
        price: '5,100',
        imagePath: 'lib/images/coldbrew/ColdBrew.jpg',

        temperatureOption: 'iceonly',
      ),
      Cafe(
        id: 'coldbrew2',
        name: '돌체 콜드 브루',
        engname: 'Dolce Cold Brew',
        discription:
            '무더운 여름철,동남아 휴가지에서 즐기는 커피를 떠오르게 하는 베스트 x 베스트 조합인 돌체 콜드 브루를 만나보세요!',
        price: '6,000',
        imagePath: 'lib/images/coldbrew/DolceColdBrew.jpg',

        temperatureOption: 'iceonly',
      ),
      Cafe(
        id: 'coldbrew3',
        name: '바닐라 크림 콜드 브루',
        engname: 'Vanilla Cream Cold Brew',
        discription: '콜드 브루에 더해진 바닐라 크림으로 깔끔하면서 달콤한 콜드 브루를 새롭게 즐길 수 있는 음료입니다.',
        price: '6,000',
        imagePath: 'lib/images/coldbrew/Vanila_Cream_ColdBrew.jpg',

        temperatureOption: 'iceonly',
      ),
      Cafe(
        id: 'coldbrew4',
        name: '오트 콜드 브루',
        engname: 'Oat Cold Brew',
        discription:
            '콜드 브루의 풍미와 깔끔한 오트음료(식물성 대체유)가 어우러진 달콤 고소한 라떼.식물성 대체유를 사용해 모든 고객이 부담없이 즐길 수 있는 콜드 브루 음료',
        price: '6,000',
        imagePath: 'lib/images/coldbrew/Oat_Cold_Brew.jpg',

        temperatureOption: 'iceonly',
      ),
    ],

    'frappuchino': [
      Cafe(
        id: 'frappuchino1',
        name: '더블 에스프레소 칩 프라푸치노',
        engname: 'Double Espresso Chip Frappuccino',
        discription:
            '리스트레토 에스프레소 2샷과 에스프레소 칩, 하프앤하프가 진하게 어우러진 커피의 기본에 충실한 프라푸치노',
        price: '6,500',
        imagePath: 'lib/images/frappuchino/Double_Espresso_Chip.jpg',

        temperatureOption: 'iceonly',
      ),
      Cafe(
        id: 'frappuchino2',
        name: '제주 말차 크림 프라푸치노',
        engname: 'Jeju Malcha Cream Frappuccino',
        discription: '깊고 진한 말차 본연의 맛과 향을 시원하고 부드럽게 즐길 수 있는 프라푸치노',
        price: '6,500',
        imagePath: 'lib/images/frappuchino/Jeju_Malcha_Cream.jpg',

        temperatureOption: 'iceonly',
      ),
      Cafe(
        id: 'frappuchino3',
        name: '자바 칩 프라푸치노',
        engname: 'Java Chip Frapuccino',
        discription: '커피, 모카 소스, 진한 초콜릿 칩이 입안 가득 느껴지는 프라푸치노',
        price: '6,500',
        imagePath: 'lib/images/frappuchino/Java_Chip.jpg',

        temperatureOption: 'iceonly',
      ),
      Cafe(
        id: 'frappuchino4',
        name: '초콜릿 크림 칩 프라푸치노',
        engname: 'Chocaolate Cream Chip Frappuccino',
        discription: '모카 소스와 진한 초콜릿 칩, 초콜릿 드리즐이 올라간 달콤한 크림 프라푸치노',
        price: '6,200',
        imagePath: 'lib/images/frappuchino/Chocolate_Cream_Chip.jpg',

        temperatureOption: 'iceonly',
      ),
      Cafe(
        id: 'frappuchino5',
        name: '카라멜 프라푸치노',
        engname: 'Caramel Frappuccino',
        discription: '카라멜과 커피가 어우러진 프라푸치노',
        price: '6,100',
        imagePath: 'lib/images/frappuchino/Caramel_Frappuccino.jpg',

        temperatureOption: 'iceonly',
      ),
      Cafe(
        id: 'frappuchino6',
        name: '에스프레소 프라푸치노',
        engname: 'Espresso Frappuccino',
        discription: '풍부하고 진한 에스프레소 샷의 강렬함과 달콤함이 어우러져 깊은 커피의 풍미를 느낄 수 있는 프라푸치노',
        price: '5,700',
        imagePath: 'lib/images/frappuchino/Espresso_Frappuccino.jpg',

        temperatureOption: 'iceonly',
      ),
    ],

    'teabana': [
      Cafe(
        id: 'teabana1',
        name: '슈크림 말차 라떼',
        engname: 'Choux Cream Malcha Latte',
        discription:
            '슈크림의 색다른 변신! 봄을 알리는 초록&노랑의 비주얼과 쌉싸름한 말차, 달콤한 슈크림이 잘 어우러진 티 라떼 음료',
        price: '6,500',
        imagePath: 'lib/images/tea/Malcha_Latte.jpg',
      ),
      Cafe(
        id: 'teabana2',
        name: '복숭아 핫 티',
        engname: 'Peach Black Tea',
        discription:
            '찻잎을 직접 우려 만든 상큼하고 청량한 아이스 티로, 복숭아의 진한 맛과 홍차의 풍미를 느낄 수 있는 음료',
        price: '6,100',
        imagePath: 'lib/images/tea/PeachHotTea.jpg',
      ),
      Cafe(
        id: 'teabana3',
        name: '클래식 밀크 티',
        engname: 'Classic Milk Tea',
        discription: '진하게 오래 우려낸 티바나 블랙 티의 깊은 풍미와 우유의 조화로움을 담아낸 맛에 집중한 밀크 티',
        price: '6,100',
        imagePath: 'lib/images/tea/Classic_Milk_Tea.jpg',
      ),
      Cafe(
        id: 'teabana4',
        name: '제주 말차 라떼',
        engname: 'Jeju Malcha Latte',
        discription:
            '차광재배한 어린 녹찻잎을 곱게 갈아 깊고 진한 말차 본연의 맛과 향을 부드럽게 즐길 수 있는 제주 말차 라떼',
        price: '6,100',
        imagePath: 'lib/images/tea/Jeju_Malcha_Latte.jpg',
      ),
      Cafe(
        id: 'teabana5',
        name: '유자 민트 티',
        engname: 'Yuja Mint Tea',
        discription: '달콤한 국내산 고흥 유자와 알싸하고 은은한 진저, 우릴 수록 상쾌한 민트 티가 조화로운 유자 민트 티',
        price: '6,100',
        imagePath: 'lib/images/tea/Yuja_Mint_Tea.jpg',
      ),
      Cafe(
        id: 'teabana6',
        name: '자몽 허니 블랙 티',
        engname: 'Grepefruit Honey Black Tea',
        discription: '새콤한 자몽과 달콤한 꿀이 깊고 그윽한 풍미의 스타벅스 티바나 블랙 티의 조화',
        price: '5,900',
        imagePath: 'lib/images/tea/Honey_Black_Tea.jpg',
      ),
      Cafe(
        id: 'teabana7',
        name: '제주 유기농 녹차로 만든 티',
        engname: 'Jeju Green Tea',
        discription: '유기농 녹차 티백만을 100%(물 제외) 사용한 티로 맑은 수색과 고유의 풍미가 뛰어난 녹차',
        price: '5,300',
        imagePath: 'lib/images/tea/Jeju_Green_Tea.jpg',
      ),
      Cafe(
        id: 'teabana8',
        name: '잉글리쉬 브렉퍼스트 티',
        engname: 'English Breakfast Brewed Tea',
        discription: '인도 아삼, 제주도 유기농 홍차가 블렌딩되어 진한 벌꿀향과 그윽한 몰트향이 특징인 블랙 티',
        price: '4,500',
        imagePath: 'lib/images/tea/English_Black_Tea.jpg',
      ),
      Cafe(
        id: 'teabana9',
        name: '얼 그레이 티',
        engname: 'Earl Grey Brewed Tea',
        discription: '꽃향 가득한 라벤더와 베르가못 향이 진한 홍차와 블렌딩된 향긋한 블랙 티',
        price: '4,500',
        imagePath: 'lib/images/tea/Earl_Grey_Tea.jpg',
      ),
      Cafe(
        id: 'teabana10',
        name: '유스베리 티',
        engname: 'Youthberry Brewed Tea',
        discription:
            '제주산 찻잎으로 만든 황차에 사과, 망고, 파인애플, 히비스커스, 로즈힙 등이 블렌딩되어 핑크빛 컬러가 감도는 수색과 베리류의 새콤함을 느낄 수 있는 옐로우 티',
        price: '4,500',
        imagePath: 'lib/images/tea/Youthberry_Tea.jpg',
      ),
      Cafe(
        id: 'teabana11',
        name: '히비스커스 블렌드 티',
        engname: 'Hibiscus Blend Brewed Tea',
        discription: '히비스커스, 사과, 파파야, 망고, 레몬그라스 등이 블렌딩된 상큼한 허브 티',
        price: '4,500',
        imagePath: 'lib/images/tea/Hibiscus_Blend_Tea.jpg',
      ),
      Cafe(
        id: 'teabana12',
        name: '민트 블렌드 티',
        engname: 'Mint Blend Brewed Tea',
        discription: '스피어민트, 페퍼민트, 레몬머틀이 블렌딩된 상쾌한 허브 티',
        price: '4,500',
        imagePath: 'lib/images/tea/Mint_Blend_Tea.jpg',
      ),
      Cafe(
        id: 'teabana13',
        name: '케모마일 블렌드 티',
        engname: 'Chamomile Blend Brewed Tea',
        discription:
            '캐모마일과 레몬 그라스, 레몬밤, 히비스커스 등 블렌딩되어 은은하고 차분한 향이 기분을 좋게하는 허브 티',
        price: '4,500',
        imagePath: 'lib/images/tea/Chamomile_Blend_Tea.jpg',
      ),
    ],
  };

  // 선택된 카페 아이템을 저장하는 변수
  Cafe? _selectedCafe;

  // 특정 카테고리의 리스트 가져오기
  List<Cafe> getMenu(String category) {
    return _cafeMenu[category] ?? [];
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
