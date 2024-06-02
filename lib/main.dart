import 'dart:io';
import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import 'package:ohhferta/src/external/locators/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  MainLocator()(GetIt.instance);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MultipleImageSelector(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MultipleImageSelector extends StatefulWidget {
  const MultipleImageSelector({super.key});

  @override
  State<MultipleImageSelector> createState() => _MultipleImageSelectorState();
}

class _MultipleImageSelectorState extends State<MultipleImageSelector> {
  late final List<XFile> images;
  late final ImagePicker picker;

  @override
  void initState() {
    super.initState();

    images = [];
    picker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => getImages(),
                child: const Text('Select Image from Gallery and Camera'),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: SizedBox(
                  child: images.isEmpty
                      ? const Center(child: Text('Sorry nothing selected!!'))
                      : GridView.builder(
                          itemCount: images.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemBuilder: (_, int index) {
                            return Image.file(File(images[index].path));
                          }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Nothing is selected')));
  }

  Future<void> getImages() async {
    final files = await picker.pickMultiImage();

    if (files.isEmpty) {
      _showSnackBar();
      return;
    }

    _setImages(files);

    for (final file in files) {
      final fullName = file.path.split(Platform.pathSeparator).last;
      final name = fullName.split('.').first;

      final data = await compress(file);
      final directory = await getDownloadsDirectory();

      log('${directory?.path}/bed_$name.webp');

      final webp = XFile.fromData(
        data!,
        length: data.length,
        name: 'bed_$name.webp',
        mimeType: 'image/webp',
        path: '${directory?.path}/bed_$name.webp',
      );

      webp
          .saveTo('${directory?.path}/bed_$name.webp')
          .whenComplete(() => _setImages([webp]));
    }
  }

  Future<Uint8List?> compress(XFile file) async {
    final data = await FlutterImageCompress.compressWithFile(
      file.path,
      quality: 80,
      format: CompressFormat.webp,
    );

    return data;
  }

  void _setImages(List<XFile> files) {
    setState(() {
      for (final file in files) {
        images.add(file);
      }
    });
  }
}
