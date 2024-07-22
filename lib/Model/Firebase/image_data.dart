import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';

class ImageData extends GetxController {

  var db = FirebaseFirestore.instance;

  Future addData(String url, String size) async {
    await db
        .collection("singhalsaransh40@gmail.com")
        .doc("pic")
        .collection("adding pic")
        .doc("${Timestamp.now().nanoseconds}")
        .set({"created at": Timestamp.now(), "image":url, "size" : size});
  }

  Future deleteData(XFile image) async {
    db
        .collection("singhalsaransh40@gmail.com")
        .doc("pic")
        .collection("adding pic")
        .doc("${Timestamp.now().nanoseconds}")
        .delete();
  }


}
