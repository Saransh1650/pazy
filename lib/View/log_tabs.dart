import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LogTabs extends StatelessWidget {
  final String title;
  final XFile image;
  LogTabs({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(title),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.file(
                File(image.path),
                height: 80,
                width: 80,
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(border: Border.all()),
    );
  }
}
