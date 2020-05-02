import 'package:flutter/material.dart';

const _baseUrl = "api.covid19india.org";

const _appId = "ca-app-pub-3940256099942544~3347511713";
const _banner = "ca-app-pub-3940256099942544/6300978111";
const _largeBanner = "ca-app-pub-3940256099942544/6300978111";
const _mediumBanner = "ca-app-pub-3940256099942544/6300978111";
const _fullBanner = "ca-app-pub-3940256099942544/6300978111";
const _leaderboardBanner = "ca-app-pub-3940256099942544/6300978111";
const _smartBanner = "ca-app-pub-3940256099942544/6300978111";

const _interstitialAd= "ca-app-pub-3940256099942544/1033173712";

const _interval = 5;

/* Api Enum */
enum endpoint {
  getResources
}

/* Admob Enum */
enum bannerAdType {
  BANNER, // 320x50
  LARGE_BANNER, // 320x100
  MEDIUM_RECTANGLE, // 300x250
  FULL_BANNER, // 468x60
  LEADERBOARD, // 728x90
  SMART_BANNER, // Auto
}

/* List of Api Endpoint */
Map<endpoint, String> _apiEndpoint = {
  endpoint.getResources: "/resources/resources.json",
};

/* List of Banner Ads - Admob */
Map<bannerAdType, String> _bannerAdType = {
  bannerAdType.BANNER: _banner,
  bannerAdType.LARGE_BANNER: _largeBanner,
  bannerAdType.MEDIUM_RECTANGLE: _mediumBanner,
  bannerAdType.FULL_BANNER: _fullBanner,
  bannerAdType.LEADERBOARD: _leaderboardBanner,
  bannerAdType.SMART_BANNER: _smartBanner,
};
  

/* Api */
String getApiEndpoint(endpoint) => _apiEndpoint[endpoint];
String getBaseurl() => _baseUrl;
int getInterval() => _interval;

/*Admob */
String getAppId() => _appId;
String getBannerAdUnitId(bannerAdType) => _bannerAdType[bannerAdType];
String getInterstitialAdUnitId() => _interstitialAd;



Map <String,dynamic> categoryInformation = {
  "Accommodation and Shelter Homes" : {
    "icon" : Icon(Icons.home),
  },
  "Ambulance" : {
    "icon" : Icon(Icons.card_membership),
  },
  "CoVID-19 Testing Lab" : {
    "icon" : Icon(Icons.label),
  },
  "Community Kitchen" : {
    "icon" : Icon(Icons.home),
  },
  "Delivery [Vegetables, Fruits, Groceries, Medicines, etc.]" : {
    "icon" : Icon(Icons.font_download),
  },
  "Fire Brigade" : {
    "icon" : Icon(Icons.home),
  },
  "Free Food" : {
    "icon" : Icon(Icons.home),
  },
  "Fundraisers" : {
    "icon" : Icon(Icons.home),
  },
  "Government Helpline" : {
    "icon" : Icon(Icons.home),
  },
  "Hospitals and Centers" : {
    "icon" : Icon(Icons.home),
  },
  "Mental well being and Emotional Support" : {
    "icon" : Icon(Icons.home),
  },
  "Other" : {
    "icon" : Icon(Icons.home),
  },
  "Police" : {
    "icon" : Icon(Icons.control_point_duplicate),
  },
  "Senior Citizen Support" : {
    "icon" : Icon(Icons.home),
  },
  "Transportation" : {
    "icon" : Icon(Icons.home),
  },

};

