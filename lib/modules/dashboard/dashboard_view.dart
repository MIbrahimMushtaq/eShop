import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';
import 'dashboard_logic.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardLogic>(
        init: DashboardLogic(),
        builder: (logic){
      return Scaffold(
        body: SafeArea(
          child: logic.widgetOptions.elementAt(logic.selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                label: 'Home'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                label: 'Cart'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'WishL List'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile'
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: logic.selectedIndex,
            selectedItemColor: Clr.colorPrimary,
            iconSize: 24,
            onTap: logic.onItemTapped,
            elevation: 5
        ),
      );
    });
  }
}
