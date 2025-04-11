import 'package:HERMESCAFE/model/cafe.dart';
import 'package:flutter/material.dart';

class IcedCafeViewmodel extends ChangeNotifier {
  final Map<String, List<Cafe>> _cafeIceMenu = {
    'icedespresso': [
      Cafe(
        id: 'icedespresso1',
        name: '아이스 슈크림라떼',
        engname: 'Iced Choux Cream Latte',
        discription:
            '우리가 봄을 기다리는 이유!\n봄 하면 떠오르는 노란색 슈크림과 에스프레소의\n완벽한 조화가 돋보이는 음료입니다.',
        price: '6,500',
        imagePath: 'lib/images/espresso/IcedChouxCreamLatte.jpg',
      ),
      Cafe(
        id: 'icedespresso2',
        name: '아이스 플랫 화이트',
        engname: 'Iced Flat White',
        discription:
            '부드러운 리스트레토 샷과 완벽한 양의 스팀밀크를 더해, 카페라떼 보다 커피의 맛을 진하게 즐길 수 있는 에스프레소 음료입니다.',
        price: '5,800',
        imagePath: 'lib/images/espresso/IcedFlatWhite.jpg',
      ),
      Cafe(
        id: 'icedespresso3',
        name: '아이스 카페 아메리카노',
        engname: 'Iced Caffe Americano',
        discription: '고소한 향미 부드러운 질감과 무거운 바디가 어우러진 블렌딩',
        price: '4,500',
        imagePath: 'lib/images/espresso/iceAmericano.jpg',
      ),
      Cafe(
        id: 'icedespresso4',
        name: '아이스 카페 라떼',
        engname: 'Iced Caffe Latte',
        discription:
            '풍부하고 진한 에스프레소가 신선한 스팀 밀크를 만나\n부드러워진 커피 위에 우유 거품을 살짝 얹은 대표적인\n커피 라떼',
        price: '5,000',
        imagePath: 'lib/images/espresso/IcedCafeLatte.jpg',
      ),
      Cafe(
        id: 'icedespresso5',
        name: '아이스 돌체 라떼',
        engname: 'Iced Dolce Latte',
        discription:
            '스타벅스의 다른 커피 음료보다 더욱 깊은 커피의 맛과 향에 깔끔한 무지방 우류와 부드러운 돌체 시럽이 들어간 음료로 달콤하고 진한 커피 라떼',
        price: '6,100',
        imagePath: 'lib/images/espresso/IcedDolceLatte.jpg',
      ),
      Cafe(
        id: 'icedespresso6',
        name: '아이스 카페 모카',
        engname: 'Iced Caffe Mocha',
        discription:
            '진한 초콜릿 모카 시럽과 풍부한 에스프레소를\n스팀밀크 와 섞어 휘핑크림으로 마무리한 음료로 진한 에스프레소와 초콜릿 맛이 어우러진 커피',
        price: '5,500',
        imagePath: 'lib/images/espresso/IceCafeMocha.jpg',
      ),
      Cafe(
        id: 'icedespresso7',
        name: '아이스 카푸치노',
        engname: 'Iced Cappuccino',
        discription:
            '풍부하고 진한 에스프레소에 따뜻한 우유와 벨벳 같은\n우유거품이 1:1 비율로 어우러져 마무리된 커피 음료',
        price: '5,200',
        imagePath: 'lib/images/espresso/IcedCappuchino.jpg',
      ),
      Cafe(
        id: 'icedespresso8',
        name: '아이스 카라멜 마키아또',
        engname: 'Iced Caramel Macchiato',
        discription:
            '향긋한 바닐라 시럽과 따뜻한 스팀 밀크 위에 풍성한 우유 거품을 얹고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료',
        price: '6,100',
        imagePath: 'lib/images/espresso/Iced Caramel Macchiato.jpg',
      ),
      Cafe(
        id: 'icedespresso9',
        name: '아이스 화이트 초콜릿 모카',
        engname: 'Iced White Chocolate Mocha',
        discription:
            '달콤하고 부드러운 화이트 초콜릿 시럽과 에스프레소를 스팀 밀크와 섞어 휘핑크림으로 마무리한 음료로 달콤함과 강렬한 에스프레소가 부드럽게 어우러진 커피',
        price: '6,100',
        imagePath: 'lib/images/espresso/Iced White Chocolate Mocha.jpg',
      ),
      Cafe(
        id: 'icedespresso10',
        name: '아이스 바닐라 빈 라떼',
        engname: 'Iced Vanilla Bean Latte',
        discription: '바닐라 빈 시럽이 부드럽게 어우러진 카페 라떼',
        price: '7,000',
        imagePath: 'lib/images/espresso/Iced Vanilla Bean Latte.jpg',
      ),
    ],
    'icedteabana': [
      Cafe(
        id: 'icedteabana1',
        name: '아이스 슈크림 말차 라떼',
        engname: 'Iced Choux Cream Malcha Latte',
        discription:
            '슈크림의 색다른 변신! 봄을 알리는 초록&노랑의 비주얼과 쌉싸름한 말차, 달콤한 슈크림이 잘 어우러진 티 라떼 음료',
        price: '6,500',
        imagePath: 'lib/images/tea/Iced_Malcha_Latte.jpg',
      ),
      Cafe(
        id: 'icedteabana2',
        name: '복숭아 아이스 티',
        engname: 'Iced Peach Black Tea',
        discription:
            '찻잎을 직접 우려 만든 상큼하고 청량한 아이스 티로, 복숭아의 진한 맛과 홍차의 조화가 매력적인 음료\n*Hot Tea로도 즐기실 수 있습니다.',
        price: '6,100',
        imagePath: 'lib/images/tea/IcedBlackTea.jpg',
      ),
      Cafe(
        id: 'icedteabana3',
        name: '아이스 클래식 밀크 티',
        engname: 'Iced Classic Milk Tea',
        discription: '진하게 오래 우려낸 티바나 블랙 티의 깊은 풍미와 우유의 조화로움을 담아낸 맛에 집중한 밀크 티',
        price: '6,100',
        imagePath: 'lib/images/tea/IcedClassicMilkTea.jpg',
      ),
      Cafe(
        id: 'icedteabana4',
        name: '아이스 제주 말차 라떼',
        engname: 'Iced Jeju Malcha Latte',
        discription:
            '차광재배한 어린 녹찻잎을 곱게 갈아 깊고 진한 말차 본연의 맛과 향을 부드럽게 즐길 수 있는 제주 말차 라떼',
        price: '6,100',
        imagePath: 'lib/images/tea/IcedJejuMalchaLatte.jpg',
      ),
      Cafe(
        id: 'icedteabana5',
        name: '아이스 유자 민트 티',
        engname: 'Iced Yuja Mint Tea',
        discription: '달콤한 국내산 고흥 유자와 알싸하고 은은한 진저, 우릴 수록 상쾌한 민트 티가 조화로운 유자 민트 티',
        price: '6,100',
        imagePath: 'lib/images/tea/IcedYujaMintTea.jpg',
      ),
      Cafe(
        id: 'icedteabana6',
        name: '아이스 자몽 허니 블랙 티',
        engname: 'Iced Grepefruit Honey Black Tea',
        discription: '새콤한 자몽과 달콤한 꿀이 깊고 그윽한 풍미의 스타벅스 티바나 블랙 티의 조화',
        price: '5,900',
        imagePath: 'lib/images/tea/IcedBlackTea.jpg',
      ),
      Cafe(
        id: 'icedteabana7',
        name: '아이스 제주 유기농 녹차로 만든 티',
        engname: 'Iced Jeju Green Tea',
        discription: '유기농 녹차 티백만을 100%(물 제외) 사용한 티로 맑은 수색과 고유의 풍미가 뛰어난 녹차',
        price: '5,300',
        imagePath: 'lib/images/tea/IcedJejuGreenTea.jpg',
      ),
      Cafe(
        id: 'icedteabana8',
        name: '아이스 잉글리쉬 브렉퍼스트 티',
        engname: 'Iced English Breakfast Brewed Tea',
        discription: '인도 아삼, 제주도 유기농 홍차가 블렌딩되어 진한 벌꿀향과 그윽한 몰트향이 특징인 블랙 티',
        price: '4,500',
        imagePath: 'lib/images/tea/IcedEngTea.jpg',
      ),
      Cafe(
        id: 'icedteabana9',
        name: '아이스 얼 그레이 티',
        engname: 'Iced Earl Grey Brewed Tea',
        discription: '꽃향 가득한 라벤더와 베르가못 향이 진한 홍차와 블렌딩된 향긋한 블랙 티',
        price: '4,500',
        imagePath: 'lib/images/tea/IcedEarlGreyTea.jpg',
      ),
      Cafe(
        id: 'icedteabana10',
        name: '아이스 유스베리 티',
        engname: 'Iced Youthberry Brewed Tea',
        discription:
            '제주산 찻잎으로 만든 황차에 사과, 망고, 파인애플, 히비스커스, 로즈힙 등이 블렌딩되어 핑크빛 컬러가 감도는 수색과 베리류의 새콤함을 느낄 수 있는 옐로우 티',
        price: '4,500',
        imagePath: 'lib/images/tea/IcedYouthberryTea.jpg',
      ),
      Cafe(
        id: 'icedteabana11',
        name: '아이스 히비스커스 블렌드 티',
        engname: 'Iced Hibiscus Blend Brewed Tea',
        discription: '히비스커스, 사과, 파파야, 망고, 레몬그라스 등이 블렌딩된 상큼한 허브 티',
        price: '4,500',
        imagePath: 'lib/images/tea/IcedHibiscusTea.jpg',
      ),
      Cafe(
        id: 'icedteabana12',
        name: '아이스 민트 블렌드 티',
        engname: 'Iced Mint Blend Brewed Tea',
        discription: '스피어민트, 페퍼민트, 레몬머틀이 블렌딩된 상쾌한 허브 티',
        price: '4,500',
        imagePath: 'lib/images/tea/IcedMintBlendTea.jpg',
      ),
      Cafe(
        id: 'icedteabana13',
        name: '아이스 케모마일 블렌드 티',
        engname: 'Iced Chamomile Blend Brewed Tea',
        discription:
            '캐모마일과 레몬 그라스, 레몬밤, 히비스커스 등 블렌딩되어 은은하고 차분한 향이 기분을 좋게하는 허브 티',
        price: '4,500',
        imagePath: 'lib/images/tea/IcedChamomileTea.jpg',
      ),
    ],
  };

  List<Cafe> getIceMenu(String category) {
    return _cafeIceMenu[category] ?? [];
  }
}
