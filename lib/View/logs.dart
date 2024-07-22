import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pazy/Model/Firebase/image_view_log.dart';
import 'package:pazy/Model/logs_data.dart';
import 'package:pazy/View/log_tabs.dart';
import 'package:pazy/View/top_tab_bar.dart';

class Logs extends StatelessWidget {
  const Logs({super.key});

  @override
  Widget build(BuildContext context) {
   
    

    return Scaffold(

      body: TopTabBar()
          

      // body: ListView.builder(
      //   itemCount: logs.logMap.length,
      //   itemBuilder: (context, index) {
      //     return LogTabs(
      //         title: logs.logMap.keys.elementAt(logs.logMap.length - index - 1),
      //         image:
      //             logs.logMap.values.elementAt(logs.logMap.length - index - 1));
      //   },
      // ),
    );
  }
}
