import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

String bannerAdUnitId;

Widget getBannerAd() {
  if (kReleaseMode) {
    bannerAdUnitId = "ca-app-pub-2582751373548446/5023739547";
  } else {
    bannerAdUnitId = "ca-app-pub-3940256099942544/6300978111";
  }
  return AdmobBanner(
    adUnitId: bannerAdUnitId,
    adSize: AdmobBannerSize.LARGE_BANNER,
    listener: (AdmobAdEvent event, Map<String, dynamic> args) {
      switch (event) {
        case AdmobAdEvent.loaded:
          print('Admob banner loaded!');
          break;

        case AdmobAdEvent.opened:
          print('Admob banner opened!');
          break;

        case AdmobAdEvent.closed:
          print('Admob banner closed!');
          break;

        case AdmobAdEvent.failedToLoad:
          print(
              'Admob banner failed to load. Error code: ${args['errorCode']}');
          break;
        default:
      }
    },
  );
}

String getInterstitialAdUnit() {
  if (kReleaseMode) {
    return "ca-app-pub-2582751373548446/2050865926";
  } else
    return "ca-app-pub-3940256099942544/4411468910";
}
