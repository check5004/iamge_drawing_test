import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_saver/file_saver.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '画像編集アプリ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImageEditorPage(),
    );
  }
}

class ImageEditorPage extends StatefulWidget {
  const ImageEditorPage({super.key});

  @override
  ImageEditorPageState createState() => ImageEditorPageState();
}

class ImageEditorPageState extends State<ImageEditorPage> {
  Uint8List? _imageData;

  Future<void> _pickImage(ImageSource source) async {
    if (!kIsWeb) {
      await Permission.camera.request();
      await Permission.storage.request();
    }

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      setState(() {
        _imageData = imageBytes;
      });
    }
  }

  Future<void> _editImage() async {
    if (_imageData == null) return;

    final editedImage = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageEditor(
          image: _imageData!,
        ),
      ),
    );

    if (editedImage != null) {
      setState(() {
        _imageData = editedImage;
      });
    }
  }

  Future<void> _saveImage() async {
    if (_imageData == null) return;

    if (kIsWeb || Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      final fileName = 'edited_image_${DateTime.now().millisecondsSinceEpoch}.png';

      await FileSaver.instance.saveFile(
        name: fileName,
        bytes: _imageData!,
        mimeType: MimeType.png,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('画像のダウンロードを開始しました')),
      );
    } else {
      final result = await ImageGallerySaver.saveImage(_imageData!);
      if (result['isSuccess']) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('画像をギャラリーに保存しました')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('画像の保存に失敗しました')),
        );
      }
    }
  }

  void _resetImage() {
    setState(() {
      _imageData = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('画像編集アプリ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_imageData != null) ...[
              Image.memory(_imageData!, height: 200),
              ElevatedButton(
                onPressed: _editImage,
                child: const Text('編集'),
              ),
            ] else
              const Text('画像を選択してください'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _pickImage(ImageSource.camera),
                  child: const Text('カメラ'),
                ),
                ElevatedButton(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  child: const Text('ライブラリ'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _imageData != null ? _saveImage : null,
                  child: const Text('保存'),
                ),
                ElevatedButton(
                  onPressed: _imageData != null ? _resetImage : null,
                  child: const Text('リセット'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
