import 'package:balinasoft_test_app/pages/photo/constructor/camera.dart';
import 'package:balinasoft_test_app/pages/photo/detailed/detailed_photo_page.dart';
import 'package:balinasoft_test_app/pages/photo/gallery/photo_presenter.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({super.key});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> implements PhotoPageContract {
  late final PhotoPagePresenter presenter;
  late final List<CameraDescription> cameras;
  final _scrollController = ScrollController();

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void initState() {
    super.initState();
    presenter = PhotoPagePresenter(this);
    presenter.init();
    _scrollController.addListener(_onScroll);
    availableCameras().then((value) => cameras = value);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      presenter.loadMoreImages();
    }
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
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: presenter.images.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: GridTile(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailedPhotoPage(image: presenter.images[index]),
                      ),
                    );
                  },
                  onLongPress: () {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Delete confirmation'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: const <Widget>[
                                Text('Do you want to delete the comment?'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Approve'),
                              onPressed: () async {
                                await presenter.deleteImage(presenter.images[index].id);
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          presenter.images[index].imagePath,
                        ),
                      ),
                      Text(
                        presenter.images[index].date.toString().substring(0, 10),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TakePictureScreen(
                camera: cameras.first,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
