import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final PageController pageController = PageController();

  final currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;

    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}