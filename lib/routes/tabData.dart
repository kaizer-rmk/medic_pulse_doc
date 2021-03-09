import 'package:flutter/cupertino.dart';

enum TabItem{home, chats, appointments}

final Map<TabItem, String> tabName={
  TabItem.home:"Home",
  TabItem.chats:"Chats",
  TabItem.appointments:"Appointments",
};

Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
  TabItem.home: GlobalKey<NavigatorState>(),
  TabItem.chats: GlobalKey<NavigatorState>(),
  TabItem.appointments: GlobalKey<NavigatorState>()
};