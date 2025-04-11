import 'package:HERMESCAFE/devicetype/device_type_helper.dart';

class ResponsiveStyles {
  static double mainTitleFontSize(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 18;
      case DeviceType.small:
        return 20;
      case DeviceType.medium:
        return 20;
      case DeviceType.large:
        return 20;
      case DeviceType.tablet:
        return 20;
    }
  }

  static double suggestTileHeight(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 265;
      case DeviceType.small:
        return 132;
      case DeviceType.medium:
        return 328;
      case DeviceType.large:
        return 146;
      case DeviceType.tablet:
        return 156;
    }
  }

  static double cardHeight(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 370;
      case DeviceType.small:
        return 276;
      case DeviceType.medium:
        return 395;
      case DeviceType.large:
        return 459;
      case DeviceType.tablet:
        return 579;
    }
  }

  static double bottomTapBarHeight(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 111;
      case DeviceType.small:
        return 88;
      case DeviceType.medium:
        return 122;
      case DeviceType.large:
        return 122;
      case DeviceType.tablet:
        return 122;
    }
  }

  static double detailPageNameFontSize(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 20;
      case DeviceType.small:
        return 20;
      case DeviceType.medium:
        return 25;
      case DeviceType.large:
        return 25;
      case DeviceType.tablet:
        return 25;
    }
  }

  static double menuSelectPageNameFontSize(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 16;
      case DeviceType.small:
        return 18;
      case DeviceType.medium:
        return 18;
      case DeviceType.large:
        return 20;
      case DeviceType.tablet:
        return 25;
    }
  }

  static double menuSelectPageEngNameFontSize(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 12;
      case DeviceType.small:
        return 13;
      case DeviceType.medium:
        return 14;
      case DeviceType.large:
        return 18;
      case DeviceType.tablet:
        return 18;
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
        return 18;
    }
  }

  static double detailPageenDescFontSize(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 13;
      case DeviceType.small:
        return 13;
      case DeviceType.medium:
        return 15;
      case DeviceType.large:
        return 16;
      case DeviceType.tablet:
        return 16;
    }
  }

  static double detailPageFontNameLocation(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 30;
      case DeviceType.small:
        return 160;
      case DeviceType.medium:
        return 16;
      case DeviceType.large:
        return 16;
      case DeviceType.tablet:
        return 16;
    }
  }

  static double detailPageFontEngNameLocation(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 80;
      case DeviceType.small:
        return 205;
      case DeviceType.medium:
        return 66;
      case DeviceType.large:
        return 76;
      case DeviceType.tablet:
        return 76;
    }
  }

  static double detailPageFontDescLocation(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 160;
      case DeviceType.small:
        return 285;
      case DeviceType.medium:
        return 166;
      case DeviceType.large:
        return 176;
      case DeviceType.tablet:
        return 176;
    }
  }

  static double detailPageFontPriceLocation(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 250;
      case DeviceType.small:
        return 380;
      case DeviceType.medium:
        return 276;
      case DeviceType.large:
        return 286;
      case DeviceType.tablet:
        return 286;
    }
  }

  static double detailPagePriceFontSize(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 23;
      case DeviceType.small:
        return 20;
      case DeviceType.medium:
        return 26;
      case DeviceType.large:
        return 26;
      case DeviceType.tablet:
        return 26;
    }
  }

  static double detailPageTempLocation(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 535;
      case DeviceType.small:
        return 545;
      case DeviceType.medium:
        return 616;
      case DeviceType.large:
        return 686;
      case DeviceType.tablet:
        return 706;
    }
  }

  static double detailPageTempContainerSize(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 60;
      case DeviceType.small:
        return 30;
      case DeviceType.medium:
        return 86;
      case DeviceType.large:
        return 80;
      case DeviceType.tablet:
        return 90;
    }
  }

  static double detailPageQuantityLocation(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 450;
      case DeviceType.small:
        return 360;
      case DeviceType.medium:
        return 536;
      case DeviceType.large:
        return 556;
      case DeviceType.tablet:
        return 556;
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
        return 30;
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
        return 25;
    }
  }

  static double detailPagePriceButtonLocation(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 640;
      case DeviceType.small:
        return 580;
      case DeviceType.medium:
        return 726;
      case DeviceType.large:
        return 806;
      case DeviceType.tablet:
        return 806;
    }
  }

  static double detailPageButtonHeight(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 50;
      case DeviceType.small:
        return 50;
      case DeviceType.medium:
        return 58;
      case DeviceType.large:
        return 58;
      case DeviceType.tablet:
        return 58;
    }
  }

  static double gitcardPageImageHeight(DeviceType type) {
    switch (type) {
      case DeviceType.extraSmall:
        return 400;
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
