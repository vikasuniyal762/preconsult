import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medongosupport/preConsultModule/consts/screenSize.dart';


class FullScreenImagePage extends StatefulWidget {
  final String imagePath;
  final Function(File name) onConfirm;

  FullScreenImagePage({required this.imagePath, required this.onConfirm});

  @override
  _FullScreenImagePageState createState() => _FullScreenImagePageState();
}

class _FullScreenImagePageState extends State<FullScreenImagePage> {
  late File newImage;
  bool isRetakeMode = true;

  Future<void> openCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        newImage = File(pickedImage.path);
        isRetakeMode = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    newImage = File(widget.imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Column(
        children: [
          CircleAvatar(
            radius: ScreenSize.height(context) * 0.14,
            child: ClipOval(
              child: Image.file(
                newImage,
                fit: BoxFit.cover,
                width: ScreenSize.width(context) * 0.58,
                height: ScreenSize.height(context) * 0.265,
                // height: double.infinity,
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                ElevatedButton(
                  onPressed: isRetakeMode
                      ? () {
                    openCamera();
                  }
                      : () {
                    // Handle confirm functionality
                    widget.onConfirm(newImage);
                    // Navigator.pop(context);
                  },
                  child:
                  AutoSizeText(isRetakeMode ? 'Retake' : 'Confirm')
                ),

                ElevatedButton(
                  onPressed: () {
                   Get.back();
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}