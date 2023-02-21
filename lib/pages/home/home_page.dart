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
    return Scaffold(
      appBar: AppBar(title: Text('title')),
      body: const Center(
        child: Text('My Page!'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text('Drawer Header'),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Photos'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PhotoPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.public),
              title: const Text('Map'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MapPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
