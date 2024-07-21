import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pazy/Model/image_selector.dart';
import 'package:pazy/Model/logs_data.dart';
import 'package:pazy/View/zoomed_view.dart';
import 'package:intl/intl.dart';

class FileView extends StatefulWidget {
  final XFile image;
  FileView({super.key, required this.image});

  @override
  State<FileView> createState() => _FileViewState();
}

class _FileViewState extends State<FileView> {
  @override
  Widget build(BuildContext context) {
    final select = Get.put(ImageSelector());
    LogsData logs = Get.put(LogsData());
    return InkWell(
      onTap: () {
        setState(() {
          if(select.isSelected == true){select.isSelected = false;
          select.selectedImages.remove(widget.image);}

          else{
            Get.to(()=>ZoomedView(image: widget.image,), popGesture: true, transition: Transition.zoom);

            logs.logMap["Viewed at ${DateFormat.yMd().add_Hms().format(DateTime.now())}"] = widget.image;

          }
        });
      },
      onLongPress: () {
        setState((){select.isSelected = true;
        select.selectedImages.add(widget.image);});
      },
      child: Stack(
        children: [
          Image.file(File(widget.image.path), fit: BoxFit.fill, width: double.infinity, height: double.infinity,),
          Positioned(child: Icon(Icons.check_circle, size: 30, color: select.isSelected ? Colors.black : Colors.transparent,))
        ],
      ),
    );
  }
}
