import 'package:flutter/material.dart';

enum DeviceType { extraSmall, small, medium, pixel8, large, tablet }

class DeviceTypeHelper {
  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width == 360) {
      return DeviceType.extraSmall; //ex) iPhone SE3, 작은 안드로이드 폰
    } else if (width == 375) {
      return DeviceType.small; // ex) 일반 아이폰, 중간급 안드로이드 폰
    } else if (width <= 412) {
      return DeviceType.medium; //ex) 태블릿 , 대형화면
    } else if (width == 412) {
      return DeviceType.pixel8; //ex) 픽셀8, 픽셀8프로
    } else if (width <= 450) {
      return DeviceType.large;
    } else {
      return DeviceType.tablet;
    }
  }
}
