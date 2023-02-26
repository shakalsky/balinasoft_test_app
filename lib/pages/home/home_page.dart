import 'package:balinasoft_test_app/pages/home/home_presenter.dart';
import 'package:balinasoft_test_app/pages/map/map_page.dart';
import 'package:balinasoft_test_app/pages/photo/gallery/photo_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements HomePageContract {
  late final HomePagePresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = HomePagePresenter(this);
  }

  @override
  void stateManager() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(),
        body: const PhotoPage(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Username",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PhotoPage(),
                    ),
                  );
                },
                child: Row(
                  children: const [
                    SizedBox(
                      width: 16.0,
                    ),
                    Icon(
                      Icons.account_circle,
                      size: 48.0,
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Text('Photos'),
                    Spacer(),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MapPage(),
                    ),
                  );
                },
                child: Row(
                  children: const [
                    SizedBox(
                      width: 16.0,
                    ),
                    Icon(
                      Icons.public,
                      size: 48.0,
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Text('Map'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
