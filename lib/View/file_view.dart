import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazy/Model/Firebase/image_view_log.dart';
import 'package:pazy/Model/image_getter.dart';
import 'package:pazy/Model/image_selector.dart';
import 'package:pazy/View/zoomed_view.dart';

class FileView extends StatefulWidget {
  final String image, docId;
  FileView({super.key, required this.image, required this.docId});

  @override
  State<FileView> createState() => _FileViewState();
}

class _FileViewState extends State<FileView> {
  ImageGetter path = Get.put(ImageGetter());

  @override
  Widget build(BuildContext context) {
    ViewLog logs = Get.put(ViewLog());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
          onTap: () {
            setState(() {
              Get.to(
                  () => ZoomedView(
                        image: widget.image,
                        docId: widget.docId,
                      ),
                  popGesture: true,
                  transition: Transition.zoom);
              logs.viewLog(widget.image);
            });
          },
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                  decoration: BoxDecoration(
                    
                      border: Border.all(),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(0))),
                  child: Image.file(
                    path.getDecryptedPath(widget.image),
                    fit: BoxFit.fill,
                  ))) // Display image

          ),
    );
  }
}
