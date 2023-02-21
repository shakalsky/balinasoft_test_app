import 'package:balinasoft_test_app/dependency_injector.dart';
import 'package:balinasoft_test_app/pages/photo/gallery/photo_presenter.dart';
import 'package:flutter/material.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({super.key});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> implements PhotoPageContract {
  late final PhotoPagePresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = PhotoPagePresenter(this, i.get());
  }

  @override
  void stateManager() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 5,
        itemBuilder: (_, index) {
          return GridTile(
            child: SizedBox(
              height: 40.0,
              width: 40.0,
              child: Image.network('url'),
            ),
            footer: Text(DateTime.now().toString()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
