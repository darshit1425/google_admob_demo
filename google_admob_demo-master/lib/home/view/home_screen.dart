import 'package:flutter/material.dart';
import 'package:google_admob_demo/utils/ads_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    AdMobHelper.adMobHelper.loadBannerAd();
    AdMobHelper.adMobHelper.loadInterstitialAd();
    AdMobHelper.adMobHelper.loadRewardAd();
    AdMobHelper.adMobHelper.loadAppOpenAd();
    AdMobHelper.adMobHelper.loadNativeAd();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 250,
              child: AdWidget(
                ad: AdMobHelper.adMobHelper.bannerAd!,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                AdMobHelper.adMobHelper.interstitialAd!.show();
                AdMobHelper.adMobHelper.loadInterstitialAd();
              },
              child: Text("Interstitial Ad"),
            ),
            ElevatedButton(
              onPressed: () {
                AdMobHelper.adMobHelper.rewardedAd!.show(
                  onUserEarnedReward: (ad, reward) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("$reward"),
                      ),
                    );
                  },
                );
                AdMobHelper.adMobHelper.loadRewardAd();
              },
              child: Text("Rewarded Ad"),
            ),
            ElevatedButton(
              onPressed: () {
                AdMobHelper.adMobHelper.appOpenAd!.show();
                AdMobHelper.adMobHelper.loadAppOpenAd();
              },
              child: Text("AppOpen Ad"),
            ),
                Container(
                  height: 300,
                  child: AdWidget(
                    ad: AdMobHelper.adMobHelper.nativeAd!,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
