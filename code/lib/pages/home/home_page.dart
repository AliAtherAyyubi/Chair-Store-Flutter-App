import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';
import '../../widgets/home_category_item.dart';
import '../../widgets/home_popular_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int categoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteGreyColor,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          backgroundColor: kWhiteColor,
          onTap: (value) {
            if (value == 1) {
              Navigator.pushNamed(context, '/wishlist');
            } else if (value == 2) {
              Navigator.pushNamed(context, '/profile');
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon_home.png',
                width: 24,
                color: kBlueColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon_wishlist.png',
                width: 24,
              ),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon_profile.png',
                width: 24,
              ),
              label: 'Profile',
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/image_background.png',
          ),
          ListView(
            children: [
              //NOTE: HEADER/TITLE
              Container(
                margin: const EdgeInsets.only(top: 24),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/logo_dark.png',
                      width: 53,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Space',
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/icon_cart.png',
                      width: 30,
                    ),
                  ],
                ),
              ),
              //SEARCH BUTTON
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/search');
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                    left: 24,
                    right: 24,
                  ),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: kWhiteColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Search Furniture',
                        style: greyTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      Image.asset(
                        'assets/icon_search.png',
                        width: 24,
                        color: kGreyColor,
                      ),
                    ],
                  ),
                ),
              ),
              // NOTE : CATEGORY TITLE
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  left: 24,
                  right: 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category',
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      'Show All',
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),

              //NOTE: CATEGORY CAROUSEL
              Container(
                margin: const EdgeInsets.only(top: 25),
                child: CarouselSlider(
                  items: const [
                    HomeCategoryItem(
                      title: 'Minimalis Chair',
                      subtitle: 'Chair',
                      imageUrl: 'assets/image_product_category1.png',
                    ),
                    HomeCategoryItem(
                      title: 'Minimalis Table',
                      subtitle: 'Table',
                      imageUrl: 'assets/image_product_category2.png',
                    ),
                    HomeCategoryItem(
                      title: 'Minimalis Chair',
                      subtitle: 'Chair',
                      imageUrl: 'assets/image_product_category3.png',
                    )
                  ],
                  options: CarouselOptions(
                      autoPlay: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 700),
                      height: 140,
                      enableInfiniteScroll: false,
                      viewportFraction: 1,
                      onPageChanged: (value, _) {
                        setState(() {
                          categoryIndex = value;
                        });
                      }),
                ),
              ),

              // NOTE : CATEGORY CAROUSEL INDICATOR
              Container(
                margin: const EdgeInsets.only(top: 13, left: 24, right: 24),
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            categoryIndex == 0 ? kBlackColor : kLineDarkColor,
                      ),
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            categoryIndex == 1 ? kBlackColor : kLineDarkColor,
                      ),
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            categoryIndex == 2 ? kBlackColor : kLineDarkColor,
                      ),
                    )
                  ],
                ),
              ),

              // NOTE : POPULAR SECTION
              Container(
                margin: const EdgeInsets.only(top: 24),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                  color: kWhiteColor,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 24,
                        left: 24,
                        right: 24,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Popular',
                            style: blackTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            'Show All',
                            style: blackTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const SizedBox(
                      height: 310,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            HomePopularItem(
                              title: 'Poan Chair',
                              imageUrl: 'assets/image_product_popular1.png',
                              price: 34,
                              isWishlist: true,
                            ),
                            HomePopularItem(
                              title: 'Poan Chair',
                              imageUrl: 'assets/image_product_popular2.png',
                              price: 20,
                              isWishlist: false,
                            ),
                            HomePopularItem(
                              title: 'Poan Chair',
                              imageUrl: 'assets/image_product_popular3.png',
                              price: 48,
                              isWishlist: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
