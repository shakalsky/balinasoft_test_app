import 'package:balinasoft_test_app/dependency_injector.dart';
import 'package:balinasoft_test_app/models/image.dart' as model;
import 'package:balinasoft_test_app/models/user.dart';
import 'package:balinasoft_test_app/pages/home/home_page.dart';
import 'package:balinasoft_test_app/pages/photo/detailed/detailed_photo_presenter.dart';
import 'package:flutter/material.dart';

class DetailedPhotoPage extends StatefulWidget {
  final model.Image image;
  const DetailedPhotoPage({super.key, required this.image});

  @override
  State<DetailedPhotoPage> createState() => _DetailedPhotoPageState();
}

class _DetailedPhotoPageState extends State<DetailedPhotoPage>
    implements DetailedPhotoPageContract {
  late final DetailedPhotoPagePresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = DetailedPhotoPagePresenter(this);
    presenter.getComments(i.get<User>().token, widget.image.id);
  }

  @override
  void stateManager() {
    setState(() {});
  }

  final _commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 5 * 2,
              width: double.infinity,
              child: Image.network(
                widget.image.imagePath,
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.grey[300],
              child: Text(
                widget.image.date.toString().substring(0, 16),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.separated(
                  itemCount: presenter.comments.length,
                  itemBuilder: (_, i) => GestureDetector(
                    onLongPress: () => showDialog<void>(
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
                                  await presenter.deleteComment(
                                    widget.image.id,
                                    presenter.comments[i].id,
                                  );
                                  Navigator.of(context).pop();
                                }),
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 225, 242, 255),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(presenter.comments[i].text),
                          Column(
                            children: [
                              const SizedBox(height: 24.0),
                              Text(presenter.comments[i].date.toString().substring(0, 16)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (_, __) => const SizedBox(height: 8.0),
                ),
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextField(
                    controller: _commentController,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    presenter.addComment(
                      widget.image.id,
                      _commentController.text,
                    );
                    _commentController.clear();
                  },
                  icon: const Icon(
                    Icons.send,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
