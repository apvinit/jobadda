import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/widgets.dart';

Widget getBannerAd() {
  return AdmobBanner(
    adUnitId: "ca-app-pub-3940256099942544/6300978111",
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
