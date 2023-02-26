import 'dart:async';
import 'dart:io';

import 'package:balinasoft_test_app/pages/home/home_page.dart';
import 'package:balinasoft_test_app/pages/photo/constructor/constructor_photo_presenter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class ConstructorPhotoPage extends StatefulWidget {
  final File image;

  const ConstructorPhotoPage({super.key, required this.image});

  @override
  State<ConstructorPhotoPage> createState() => _ConstructorPhotoPageState();
}

class _ConstructorPhotoPageState extends State<ConstructorPhotoPage>
    implements ConstructorPhotoPageStateContract {
  late final ConstructorPhotoPagePresenter presenter;

  double? la;
  double? lo;

  @override
  void initState() {
    super.initState();
    presenter = ConstructorPhotoPagePresenter(this);
    try {
      _determinePosition();
    } catch (e) {
      showDialog(
        context: context,
        builder: (_) => SimpleDialog(
          title: const Text('Error'),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(e.toString()),
                const SizedBox(width: 16.0),
              ],
            )
          ],
        ),
      );
    }
  }

  void _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Geolocator.getCurrentPosition().then((value) {
      setState(() {
        la = value.latitude;
        lo = value.longitude;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300.0,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Image.file(
              File(widget.image.path),
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 16.0),
          Text(la == null ? 'Please, turn on your location or just wait a bit ;)' : '$la\n$lo'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => presenter.uploadImage(widget.image, la, lo),
        child: const Icon(
          Icons.navigate_next_rounded,
          size: 40.0,
        ),
      ),
    );
  }

  @override
  void stateManager() {
    setState(() {});
  }

  @override
  void uploadingError() {}

  @override
  void uploadingSuccess() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }
}
