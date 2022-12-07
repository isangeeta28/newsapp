import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/themeNotifier.dart';

Widget _buildThemeSwitch() {
  return ListTile(
    title: Text(
      "Dark Mode",
      style: TextStyle(
        fontWeight: FontWeight.w900,
      ),
    ),
    trailing: Consumer<ThemeNotifier>(
      builder: (context, notifier, child) => CupertinoSwitch(
        onChanged: (val) {
          notifier.toggleTheme();
        },
        value: notifier.dark!,
        activeColor: Theme.of(context).accentColor,
      ),
    ),
  );
}