import 'dart:math';

import 'package:anime_app/screens/search_screen.dart';
import 'package:anime_app/screens/settings_screens.dart';
import 'package:anime_app/utils/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int initOffset = Random().nextInt(4);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "${Constants.appName}",
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.secondary,
                      offset: Offset(0.0, 1.5),
                      blurRadius: 4.0,
                    ),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SearchScreen(),
                          ));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(
                        FeatherIcons.search,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                        size: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Gap(15),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.secondary,
                      offset: Offset(0.0, 1.5),
                      blurRadius: 4.0,
                    ),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Settings(),
                          ));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(
                        FeatherIcons.settings,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                        size: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
