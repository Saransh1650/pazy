import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pazy/Model/logs_data.dart';
import 'package:share_plus/share_plus.dart';

class ZoomedView extends StatelessWidget {
  final String image;
  const ZoomedView({super.key, required this.image});

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(title: Text("Image", style: TextStyle(fontSize: 15),)),
      body: Column(
        children: [
          Expanded(
            child: Image.network(image),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              
              children: [
                IconButton(onPressed: ()async{
                  final result = await Share.shareUri(Uri.http(image));

                  if (result.status == ShareResultStatus.success) {
                        print('Shared!');

                      }

                }, icon: Icon(Icons.share, size: 35,)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.info,size: 35))
              ],
            ),
          )
        ],
      ),
    );
  }
}
