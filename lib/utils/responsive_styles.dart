import 'package:HERMESCAFE/devicetype/device_type_helper.dart';

class ResponsiveStyles {
  static double suggestTileHeight(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 102;
      case DeviceType.small:
        return 106;
      case DeviceType.medium:
        return 108;
      case DeviceType.large:
        return 120;
      case DeviceType.tablet:
        return 500;
    }
  }

  static double cardHeight(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 276;
      case DeviceType.small:
        return 276;
      case DeviceType.medium:
        return 440;
      case DeviceType.large:
        return 480;
      case DeviceType.tablet:
        return 500;
    }
  }

  static double bottomTapBarHeight(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 276;
      case DeviceType.small:
        return 88;
      case DeviceType.medium:
        return 122;
      case DeviceType.large:
        return 122;
      case DeviceType.tablet:
        return 500;
    }
  }

  static double detailPageNameFontSize(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 16;
      case DeviceType.small:
        return 20;
      case DeviceType.medium:
        return 25;
      case DeviceType.large:
        return 25;
      case DeviceType.tablet:
        return 500;
    }
  }

  static double detailPageEngNameFontSize(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 16;
      case DeviceType.small:
        return 20;
      case DeviceType.medium:
        return 16;
      case DeviceType.large:
        return 18;
      case DeviceType.tablet:
        return 500;
    }
  }

  static double detailPageenDescFontSize(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 16;
      case DeviceType.small:
        return 13;
      case DeviceType.medium:
        return 16;
      case DeviceType.large:
        return 16;
      case DeviceType.tablet:
        return 500;
    }
  }

  static double detailPageFontNameLocation(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 16;
      case DeviceType.small:
        return 160;
      case DeviceType.medium:
        return 16;
      case DeviceType.large:
        return 16;
      case DeviceType.tablet:
        return 500;
    }
  }

  static double detailPageFontEngNameLocation(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 16;
      case DeviceType.small:
        return 205;
      case DeviceType.medium:
        return 66;
      case DeviceType.large:
        return 76;
      case DeviceType.tablet:
        return 500;
    }
  }

  static double detailPageFontDescLocation(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 16;
      case DeviceType.small:
        return 285;
      case DeviceType.medium:
        return 166;
      case DeviceType.large:
        return 176;
      case DeviceType.tablet:
        return 500;
    }
  }

  static double detailPageFontPriceLocation(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 16;
      case DeviceType.small:
        return 380;
      case DeviceType.medium:
        return 276;
      case DeviceType.large:
        return 286;
      case DeviceType.tablet:
        return 500;
    }
  }

  static double detailPagePriceFontSize(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 16;
      case DeviceType.small:
        return 20;
      case DeviceType.medium:
        return 26;
      case DeviceType.large:
        return 26;
      case DeviceType.tablet:
        return 10;
    }
  }

  static double detailPageTempLocation(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 16;
      case DeviceType.small:
        return 545;
      case DeviceType.medium:
        return 626;
      case DeviceType.large:
        return 656;
      case DeviceType.tablet:
        return 500;
    }
  }

  static double detailPageTempContainerSize(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 16;
      case DeviceType.small:
        return 30;
      case DeviceType.medium:
        return 70;
      case DeviceType.large:
        return 80;
      case DeviceType.tablet:
        return 500;
    }
  }

  static double detailPageQuantityLocation(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 16;
      case DeviceType.small:
        return 360;
      case DeviceType.medium:
        return 526;
      case DeviceType.large:
        return 556;
      case DeviceType.tablet:
        return 500;
    }
  }

  static double detailPageQuantityIconSize(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 16;
      case DeviceType.small:
        return 15;
      case DeviceType.medium:
        return 25;
      case DeviceType.large:
        return 30;
      case DeviceType.tablet:
        return 500;
    }
  }

  static double detailPageQuantityfontSize(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 16;
      case DeviceType.small:
        return 16;
      case DeviceType.medium:
        return 20;
      case DeviceType.large:
        return 25;
      case DeviceType.tablet:
        return 500;
    }
  }

  static double detailPagePriceButtonLocation(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 16;
      case DeviceType.small:
        return 580;
      case DeviceType.medium:
        return 726;
      case DeviceType.large:
        return 806;
      case DeviceType.tablet:
        return 500;
    }
  }

  static double detailPageButtonHeight(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 16;
      case DeviceType.small:
        return 50;
      case DeviceType.medium:
        return 58;
      case DeviceType.large:
        return 58;
      case DeviceType.tablet:
        return 500;
    }
  }

  static double gitcardPageImageHeight(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 16;
      case DeviceType.small:
        return 400;
      case DeviceType.medium:
        return 500;
      case DeviceType.large:
        return 500;
      case DeviceType.tablet:
        return 500;
    }
  }
}
