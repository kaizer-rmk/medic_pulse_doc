import 'package:flutter/cupertino.dart';

enum TabItem { home, chats, appointments, profile }

final Map<TabItem, String> tabName = {
  TabItem.home: "Home",
  TabItem.chats: "Chats",
  TabItem.appointments: "Appointments",
  TabItem.profile: "Profile",
};

Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
  TabItem.home: GlobalKey<NavigatorState>(),
  TabItem.chats: GlobalKey<NavigatorState>(),
  TabItem.appointments: GlobalKey<NavigatorState>(),
  TabItem.profile: GlobalKey<NavigatorState>()
};
