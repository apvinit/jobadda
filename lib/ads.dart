import 'package:flutter/foundation.dart';

String getInterstitialAdUnit() {
  if (kReleaseMode) {
    return "ca-app-pub-2582751373548446/2050865926";
  } else
    return "ca-app-pub-3940256099942544/4411468910";
}

String getPostInfoPageBannerAdUnit() {
  if (kReleaseMode) {
    return "ca-app-pub-2582751373548446/4823480210";
  } else
    return "ca-app-pub-3940256099942544/6300978111";
}

String getPostVacancyDetailPageBannerAdUnit() {
  if (kReleaseMode) {
    return "ca-app-pub-2582751373548446/5023739547";
  } else
    return "ca-app-pub-3940256099942544/6300978111";
}
