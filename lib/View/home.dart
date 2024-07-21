import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:pazy/Model/image_getter.dart';
import 'package:pazy/Model/image_selector.dart';
import 'package:pazy/View/expanded_fab.dart';
import 'package:pazy/View/file_view.dart';

class Home extends StatelessWidget {
   Home({super.key});




  @override
  Widget build(BuildContext context) {
    final select = Get.put(ImageSelector());
    final image = Get.put(ImageGetter());
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            color: select.selectedImages.isNotEmpty
                ? Colors.white
                : Colors.transparent,
            onPressed: () {
               
                select.deleteImages();
              
            },
            icon: Icon(Icons.delete),
          )
        ],
        title: const Text(
          'PAZY',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 28),
        ),
        backgroundColor: Color.fromARGB(249, 9, 73, 11),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: const ExpandedFabButton(),


//      Reduced the use of SetState by using Obx


        body: Obx(()=>GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // number of columns
      ),
     itemCount: image.images.length,
      itemBuilder: (context, index) {
        return FileView(image: image.images[index],
              );
            }
          ),
        ),
      );

  }
}