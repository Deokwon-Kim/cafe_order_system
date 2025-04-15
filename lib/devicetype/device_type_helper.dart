import 'package:flutter/material.dart';

enum DeviceType { extraSmall, small, medium, large, tablet }

class DeviceTypeHelper {
  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width == 360) {
      return DeviceType.extraSmall;
    } else if (width == 375) {
      //ex) iPhone SE3, 작은 안드로이드 폰
      return DeviceType.small;
    } else if (width <= 393) {
      // ex) 일반 아이폰, 중간급 안드로이드 폰
      return DeviceType.medium;
    } else if (width <= 428) {
      // ex) 아이폰 프로맥스 ,플러스
      return DeviceType.large;
    } else {
      return DeviceType.tablet; //ex) 태블릿 , 대형화면
    }
  }
}
