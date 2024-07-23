import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pazy/Model/logs_data.dart';
import 'package:pazy/Model/new_added_struct.dart';

import 'Firebase/image_data.dart';

class ImageGetter extends GetxController {
  var images = RxList<XFile>([]);
  final ImagePicker picker = ImagePicker();
  LogsData logs = Get.put(LogsData());
  ImageData data = Get.put(ImageData());

  Future getImageGallery() async {
    images.value = await picker.pickMultiImage();

    for (XFile element in images) {
      List<String> metaData = await _uploadImageToFirebase(element);
      String url = metaData[0];
      var size = metaData[1];
      await data.addData(url, size);
    }

    print(images);
  }

  Future<List<String>> _uploadImageToFirebase(XFile image) async {
    final FirebaseStorage _storage = FirebaseStorage.instance;
    final String fileName =
        'images/${DateTime.now().millisecondsSinceEpoch}.jpg';
    final Reference ref = _storage.ref().child(fileName);
    final UploadTask task = ref.putFile(File(image.path));

    final TaskSnapshot snapshot = await task.whenComplete(() => null);
    final String downloadUrl = await snapshot.ref.getDownloadURL();
    var size = await snapshot.ref.getMetadata();

    // Add the download URL to Firestore
    return [downloadUrl, size.size.toString()];
  }

  Future getImageCamera() async {
    final XFile? camImage = await picker.pickImage(source: ImageSource.camera);
    for (XFile element in images) {
      List<String> metaData = await _uploadImageToFirebase(element);
      String url = metaData[0];
      var size = metaData[1];
      await data.addData(url, size);
    }

    print(camImage);
  }
}
