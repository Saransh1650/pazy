import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:pazy/Model/image_getter.dart';

class NewLogTab extends StatelessWidget {
  final String createdAt; final String image; final int  size;
   NewLogTab({super.key, required this.size, required this.createdAt, required this.image});
ImageGetter decryptedImage = Get.put(ImageGetter());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.grey[200],
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               children: [Text("Size : ${(size / (1024 * 1024)).toStringAsFixed(2)} MB"), Text("Added at : "+createdAt)],
              ),
      
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.file(
                  decryptedImage.getDecryptedPath(image),
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                ),
              ),
            ],)
          ],
        ),
      ),
    );
  }
}