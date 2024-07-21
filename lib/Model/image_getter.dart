import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pazy/Model/logs_data.dart';
import 'package:pazy/Model/new_added_struct.dart';

class ImageGetter extends GetxController {
  var images = RxList<XFile>([]);
  final ImagePicker picker = ImagePicker();
  LogsData logs = Get.put(LogsData());
  

  

  Future getImageGallery() async {
    images.value = await picker.pickMultiImage();

    for (XFile element in images) {
      logs.newLogs.add(NewAdded(DateFormat.yMd().add_Hms().format(DateTime.now()),
          element, (File(element.path).lengthSync() / (1024 * 1024)).toStringAsFixed(2)));

      var size = (File(element.path).lengthSync() / (1024 * 1024));
      var date = DateFormat.yMd().add_Hms().format(DateTime.now());

      logs.newImageLog["Added ${size.toStringAsFixed(2)}MB of image at $date"] =
          element;

      print((File(element.path).lengthSync() / (1024 * 1024)));
    }

    print(images);
  }

  Future getImageCamera() async {
    final XFile? camImage = await picker.pickImage(source: ImageSource.camera);

    print(camImage);
  }
}
