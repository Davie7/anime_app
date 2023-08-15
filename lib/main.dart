import 'dart:convert';
import 'package:anime_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'screens/settings_screens.dart';
import 'utils/providers/provider.dart';
import 'utils/themes/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer<ThemeNotifier>(
          builder: (context, ThemeNotifier notifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Constants.appName,
          theme: notifier.darkTheme ? Constants.darkTheme : Constants.lightTheme,
          home: AnimeListScreen(),
        );
      }),
    );
  }
}

class AnimeListScreen extends StatefulWidget {
  @override
  _AnimeListScreenState createState() => _AnimeListScreenState();
}

class _AnimeListScreenState extends State<AnimeListScreen> {
  final apiUrl = 'https://kitsu.io/api/edge/anime';

  Future<List<dynamic>> fetchAnimeData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final parsedData = json.decode(response.body);
      print(parsedData);
      return parsedData['data'];
    } else {
      throw Exception('Failed to fetch anime data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      // Settings(),
      MainScreen(),
      // FutureBuilder<List<dynamic>>(
      //   future: fetchAnimeData(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(child: CircularProgressIndicator());
      //     } else if (snapshot.hasError) {
      //       return Center(child: Text('Error: ${snapshot.error}'));
      //     } else if (snapshot.hasData) {
      //       final animeList = snapshot.data;
      //       return ListView.builder(
      //         itemCount: animeList!.length,
      //         itemBuilder: (context, index) {
      //           final anime = animeList[index];
      //           if (anime['attributes']['titles'] != null) {
      //             final title =
      //                 anime['attributes']['titles']['en'] ?? 'Unknown Title';
      //             return ListTile(
      //               title: Text(title),
      //             );
      //           } else {
      //             // Handle the case when titles are not available
      //             return ListTile(
      //               title: Text('Unknown Title'),
      //             );
      //           }
      //         },
      //       );
      //     } else {
      //       return Center(child: Text('No data available'));
      //     }
      //   },
      // ),
    );
  }
}
