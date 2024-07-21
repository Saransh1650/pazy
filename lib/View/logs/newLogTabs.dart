import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewLogTab extends StatelessWidget {
  final String size, createdAt; final XFile image;
  const NewLogTab({super.key, required this.size, required this.createdAt, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               children: [Text("Size : "+size), Text("Added at : "+createdAt)],
              ),
      
              Image.file(
                File(image.path),
                fit: BoxFit.cover,
                height: 100,
              ),
            ],)
          ],
        ),
      ),
    );
  }
}