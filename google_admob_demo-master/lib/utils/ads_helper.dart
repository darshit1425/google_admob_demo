import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobHelper {
  static final adMobHelper = AdMobHelper._();

  AdMobHelper._();

  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;
  RewardedAd? rewardedAd;
  AppOpenAd? appOpenAd;
  NativeAd? nativeAd;

  void loadBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      listener: BannerAdListener(),
      request: AdRequest(),
    );

    bannerAd!.load();
  }

  void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: "ca-app-pub-3940256099942544/1033173712",
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {},
      ),
    );
  }

  void loadRewardAd() {
    RewardedAd.load(
      adUnitId: "ca-app-pub-3940256099942544/5224354917",
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          rewardedAd = ad;
        },
        onAdFailedToLoad: (error) {},
      ),
    );
  }

  void loadAppOpenAd() {
    AppOpenAd.load(
        adUnitId: "ca-app-pub-3940256099942544/3419835294",
        request: AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) {
            appOpenAd = ad;
          },
          onAdFailedToLoad: (error) {},
        ),
        orientation: AppOpenAd.orientationPortrait);

    if (appOpenAd != null) {
      appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
        },
      );
    }
  }

  void loadNativeAd() {
    nativeAd = NativeAd(
      adUnitId: "ca-app-pub-3940256099942544/2247696110",
      factoryId: "listTile",
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          nativeAd = ad as NativeAd;
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
      request: AdRequest(),
      //   nativeTemplateStyle: NativeTemplateStyle(
      //   templateType: TemplateType.medium,
      //     mainBackgroundColor: Colors.purple,
      //     cornerRadius: 10.0,
      //     callToActionTextStyle: NativeTemplateTextStyle(
      //         textColor: Colors.cyan,
      //         backgroundColor: Colors.red,
      //         style: NativeTemplateFontStyle.monospace,
      //         size: 16.0),
      //     primaryTextStyle: NativeTemplateTextStyle(
      //         textColor: Colors.red,
      //         backgroundColor: Colors.cyan,
      //         style: NativeTemplateFontStyle.italic,
      //         size: 16.0),
      //     secondaryTextStyle: NativeTemplateTextStyle(
      //         textColor: Colors.green,
      //         backgroundColor: Colors.black,
      //         style: NativeTemplateFontStyle.bold,
      //         size: 16.0),
      //     tertiaryTextStyle: NativeTemplateTextStyle(
      //         textColor: Colors.brown,
      //         backgroundColor: Colors.amber,
      //         style: NativeTemplateFontStyle.normal,
      //         size: 16.0)
      // ),
    );
    nativeAd!.load();
  }
}
