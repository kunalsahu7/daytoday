import 'package:daytoday/screens/Filter/View/FilterScreen.dart';
import 'package:daytoday/screens/Home/View/HomeScreen.dart';
import 'package:daytoday/screens/insertpage/Income_screen/view/Income_screen_ui.dart';
import 'package:daytoday/screens/readpage/view/Read_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(
            name: '/',
            page: () => ReadScreen(),
          ),
          GetPage(
            name: '/Income',
            page: () => const IncomeScreen(),
          ),
          GetPage(
            name: '/home',
            page: () => const HomeScreen(),
          ),
          GetPage(
            name: '/filter',
            page: () => const FilterScreen(),
          ),
        ],
      ),
    ),
  );
}
