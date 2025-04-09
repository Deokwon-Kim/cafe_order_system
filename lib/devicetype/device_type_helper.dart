import 'package:flutter/material.dart';

enum DeviceType { small, medium, large }

class DeviceTypeHelper {
  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width <= 375) {
      return DeviceType.small; //ex) iPhone SE3, 작은 안드로이드 폰
    } else if (width > 375 && width < 600) {
      return DeviceType.medium; // ex) 일반 아이폰, 중간급 안드로이드 폰
    } else {
      return DeviceType.large; //ex) 태블릿 , 대형화면
    }
  }
}
