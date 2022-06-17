import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerItem {
  final String title;
  final IconData icon;

  const DrawerItem({
    required this.title,
    required this.icon,
  });
}

class DrawerItems {
  static const home = DrawerItem(title: 'Home', icon: Icons.house_outlined);
  static const favorites = DrawerItem(title: 'Favorites', icon: FontAwesomeIcons.heart);
  static const order = DrawerItem(title: 'My Order', icon: Icons.credit_card_outlined);
  static const history = DrawerItem(title: 'history', icon: Icons.replay_outlined);
  static const chat = DrawerItem(title: 'Chat', icon: FontAwesomeIcons.comment);
  static const privacy = DrawerItem(title: 'Privacy Policy', icon: Icons.file_present_outlined);

  static final List<DrawerItem> all = [home, favorites, order, history, chat, privacy];
}
