import 'package:balinasoft_test_app/dependency_injector.dart';
import 'package:balinasoft_test_app/pages/photo/detailed/detailed_photo_presenter.dart';
import 'package:flutter/material.dart';

class DetailedPhotoPage extends StatefulWidget {
  const DetailedPhotoPage({super.key});

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
  }

  @override
  void stateManager() {
    setState(() {});
  }

  final _commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Image.network('src'),
          ),
          Expanded(
              child: Column(
            children: [
              //date
              const SizedBox(
                height: 80.0,
              ),
              //comments
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (_, i) => ListTile(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    subtitle: const Text('comment'),
                    trailing: Text(DateTime.now().toString()),
                  ),
                ),
              ),
              //comment input
              Row(
                children: [
                  TextField(
                    controller: _commentController,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                  ),
                ],
              )
            ],
          )),
        ],
      ),
    );
  }
}
