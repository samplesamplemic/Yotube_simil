import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:quack_pics/history/navbar.dart';
import 'package:quack_pics/view/desktop/widget/searchBar_/searchBar.dart';
import 'package:quack_pics/view/desktop/widget/video_/video_list.dart';

import 'api/FetchAPI.dart';
import 'view/assets/ThemeModel.dart';

Future main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube simil',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'QuackPics'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Navbar nav = Navbar();

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (_) => ThemeModel(),
        child: Consumer<ThemeModel>(
            builder: (_, theme, __) => MaterialApp(
                theme: theme.currentTheme,
                home: ChangeNotifierProvider(
                  create: (_) => FetchAPI(),
                  child: Consumer<FetchAPI>(
                    builder: (_, videoList, __) => Scaffold(
                      appBar: const SearchBarApp(),
                      body: Container(
                        alignment: Alignment.topCenter,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [VideoList(videoList)],
                          ),
                        ),
                      ),
                    ),
                  ),
                ))),
      );
}
