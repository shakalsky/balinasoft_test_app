import 'package:flutter/material.dart';

class DetailedPhotoPage extends StatefulWidget {
  const DetailedPhotoPage({super.key});

  @override
  State<DetailedPhotoPage> createState() => _DetailedPhotoPageState();
}

class _DetailedPhotoPageState extends State<DetailedPhotoPage> {
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
              SizedBox(
                height: 80.0,
              ),
              //comments
              Expanded(
                child: ListView.builder(
                  itemBuilder: (_, __) => Container(),
                ),
              ),
              //comment input
              TextField(),
            ],
          )),
        ],
      ),
    );
  }
}
