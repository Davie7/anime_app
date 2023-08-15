import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/themes/constants.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_backspace,
            color: themeNotifier.darkTheme ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        title: Text(
          "Settings",
          style: TextStyle(),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                "Dark Mode",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
              subtitle: Text("Use the dark mode"),
              trailing: Consumer<ThemeNotifier>(
                builder: (context, notifier, child) => Switch(
                  onChanged: (val) {
                    notifier.toggleTheme();
                  },
                  value: notifier.darkTheme,
                  activeColor: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            Divider(),
            SizedBox(height: 10.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "This app is built to show list of available Mangas and Animes\nand also watch the trailers of them",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
