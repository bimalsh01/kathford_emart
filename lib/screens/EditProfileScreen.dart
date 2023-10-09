import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? _image;
  void openMedia() async {
    final permissionStatus = await Permission.camera.request();
    if (permissionStatus.isPermanentlyDenied) {
      openAppSettings();
    }

    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profile'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Stack(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: _image != null ? FileImage(_image!) : null,
          ),
          Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                      onPressed: () {
                        openMedia();
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                        size: 30,
                      ))))
        ],
      ),
    );
  }
}
