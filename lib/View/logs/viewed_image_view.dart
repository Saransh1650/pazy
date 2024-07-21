import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:pazy/Model/logs_data.dart';
import 'package:pazy/View/log_tabs.dart';

class ViewedImage extends StatelessWidget {
  const ViewedImage({super.key});

  @override
  Widget build(BuildContext context) {

    final logs = Get.put(LogsData());

    if (logs.logMap.isEmpty) {
      return Center(child: Text('No logs available'));
    }


    return ListView.builder(
        itemCount: logs.logMap.length,
        itemBuilder: (context, index) {
          return LogTabs(
              title: logs.logMap.keys.elementAt(logs.logMap.length - index - 1),
              image:
                  logs.logMap.values.elementAt(logs.logMap.length - index - 1));
        },
      );
  }
}