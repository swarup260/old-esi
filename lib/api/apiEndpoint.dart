import 'package:flutter/material.dart';

const _baseUrl = "sb-esi-api.herokuapp.com";
//Test _appId: ca-app-pub-3940256099942544~3347511713
//Test _banner: ca-app-pub-3940256099942544/6300978111

const _appId = "ca-app-pub-7185178541812146~2452732043";
const _banner = "ca-app-pub-7185178541812146/1181697180";
const _largeBanner = "ca-app-pub-7185178541812146/9798553803";
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
  endpoint.getResources: "/resources",
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
    "icon" : Image.asset('assets/icons/accommodation_and_shelter_homes.png'),
  },
  "Ambulance" : {
    "icon" : Image.asset('assets/icons/ambulance.png'),
  },
  "CoVID-19 Testing Lab" : {
    "icon" : Image.asset('assets/icons/lab.png'),
  },
  "Community Kitchen" : {
    "icon" : Image.asset('assets/icons/cooking.png'),
  },
  "Delivery [Vegetables, Fruits, Groceries, Medicines, etc.]" : {
    "icon" : Image.asset('assets/icons/grocery.png'),
  },
  "Fire Brigade" : {
    "icon" : Image.asset('assets/icons/fire-extinguisher.png'),
  },
  "Free Food" : {
    "icon" : Image.asset('assets/icons/free_food.png'),
  },
  "Fundraisers" : {
    "icon" : Image.asset('assets/icons/fund.png'),
  },
  "Government Helpline" : {
    "icon" : Image.asset('assets/icons/helpline.png'),
  },
  "Hospitals and Centers" : {
    "icon" : Image.asset('assets/icons/health.png'),
  },
  "Mental well being and Emotional Support" : {
    "icon" : Image.asset('assets/icons/mental-health.png'),
  },
  "Other" : {
    "icon" : Image.asset('assets/icons/information.png'),
  },
  "Police" : {
    "icon" : Image.asset('assets/icons/police-car.png'),
  },
  "Senior Citizen Support" : {
    "icon" : Image.asset('assets/icons/old-man.png'),
  },
  "Transportation" : {
    "icon" : Image.asset('assets/icons/shipped.png'),
  },

};

