/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// Directory path: assets/icons/png
  $AssetsIconsPngGen get png => const $AssetsIconsPngGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bgr_1.png
  AssetGenImage get bgr1 => const AssetGenImage('assets/images/bgr_1.png');

  /// File path: assets/images/bgr_2.png
  AssetGenImage get bgr2 => const AssetGenImage('assets/images/bgr_2.png');

  /// File path: assets/images/capybara_setting.png
  AssetGenImage get capybaraSetting =>
      const AssetGenImage('assets/images/capybara_setting.png');

  /// File path: assets/images/cloud_setting.png
  AssetGenImage get cloudSetting =>
      const AssetGenImage('assets/images/cloud_setting.png');

  /// File path: assets/images/cloud_setting_bottom.png
  AssetGenImage get cloudSettingBottom =>
      const AssetGenImage('assets/images/cloud_setting_bottom.png');

  /// File path: assets/images/function_account.png
  AssetGenImage get functionAccount =>
      const AssetGenImage('assets/images/function_account.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        bgr1,
        bgr2,
        capybaraSetting,
        cloudSetting,
        cloudSettingBottom,
        functionAccount,
        logo
      ];
}

class $AssetsIconsPngGen {
  const $AssetsIconsPngGen();

  /// File path: assets/icons/png/back_icon.png
  AssetGenImage get backIcon =>
      const AssetGenImage('assets/icons/png/back_icon.png');

  /// File path: assets/icons/png/close_icon.png
  AssetGenImage get closeIcon =>
      const AssetGenImage('assets/icons/png/close_icon.png');

  /// File path: assets/icons/png/instruct_icon.png
  AssetGenImage get instructIcon =>
      const AssetGenImage('assets/icons/png/instruct_icon.png');

  /// File path: assets/icons/png/music_icon.png
  AssetGenImage get musicIcon =>
      const AssetGenImage('assets/icons/png/music_icon.png');

  /// File path: assets/icons/png/next_icon.png
  AssetGenImage get nextIcon =>
      const AssetGenImage('assets/icons/png/next_icon.png');

  /// File path: assets/icons/png/setting_icon.png
  AssetGenImage get settingIcon =>
      const AssetGenImage('assets/icons/png/setting_icon.png');

  /// File path: assets/icons/png/speaker_icon.png
  AssetGenImage get speakerIcon =>
      const AssetGenImage('assets/icons/png/speaker_icon.png');

  /// File path: assets/icons/png/start_button.png
  AssetGenImage get startButton =>
      const AssetGenImage('assets/icons/png/start_button.png');

  /// File path: assets/icons/png/volume_icon.png
  AssetGenImage get volumeIcon =>
      const AssetGenImage('assets/icons/png/volume_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        backIcon,
        closeIcon,
        instructIcon,
        musicIcon,
        nextIcon,
        settingIcon,
        speakerIcon,
        startButton,
        volumeIcon
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
