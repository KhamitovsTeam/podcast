import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/controllers/podcast.dart';
import 'ui/home/screen.dart';

void main() {
  runApp(PodcastApp());
}

class PodcastApp extends StatefulWidget {
  @override
  _PodcastAppState createState() => _PodcastAppState();
}

class _PodcastAppState extends State<PodcastApp> {
  final _controller = PodcastController();

  @override
  void initState() {
    _controller.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PodcastController>.value(value: _controller),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Khamitovs Cast',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData.dark().copyWith(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
