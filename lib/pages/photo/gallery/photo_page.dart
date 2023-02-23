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
    presenter = PhotoPagePresenter(this);
  }

  @override
  void stateManager() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 5,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: GridTile(
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Text(
                      '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
