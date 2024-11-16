import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'pages/category_page.dart';
import 'pages/home/detail_page.dart';
import 'pages/home/home_page.dart';
import 'pages/profile/profile_page.dart';
import 'pages/search_page.dart';
import 'pages/search_result_page.dart';
import 'splash_page.dart';
import 'pages/wishlist/wishlist_page.dart';
import 'package:device_preview/device_preview.dart';

//
void main() {
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  );

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => const HomePage(),
        '/search': (context) => const SearchPage(),
        '/search-result': (context) => const SearchResultPage(),
        '/category': (context) => const CategoryPage(),
        '/wishlist': (context) => const WishlistPage(),
        '/profile': (context) => const ProfilePage(),
        '/detail': (context) => const DetailPage(),
      },
    );
  }
}
