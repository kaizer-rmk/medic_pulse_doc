import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

NavBar(BuildContext context){
  int selectedIndex;
  return FFNavigationBar(
    theme: FFNavigationBarTheme(
      barBackgroundColor: Colors.white,
      selectedItemBorderColor: Colors.yellow,
      selectedItemBackgroundColor: Colors.green,
      selectedItemIconColor: Colors.white,
      selectedItemLabelColor: Colors.black,
    ),
    selectedIndex: selectedIndex,
    onSelectTab: (index) {

    },
    items: [
      FFNavigationBarItem(
        iconData: Icons.calendar_today,
        label: 'Schedule',
      ),
      FFNavigationBarItem(
        iconData: Icons.people,
        label: 'Contacts',
      ),
      FFNavigationBarItem(
        iconData: Icons.attach_money,
        label: 'Bills',
      ),
      FFNavigationBarItem(
        iconData: Icons.note,
        label: 'Notes',
      ),
      FFNavigationBarItem(
        iconData: Icons.settings,
        label: 'Settings',
      ),
    ],
  );
}