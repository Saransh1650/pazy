import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:pazy/Model/logs_data.dart';
import 'package:pazy/View/log_tabs.dart';
import 'package:pazy/View/logs/newLogTabs.dart';

class NewAddedImageLog extends StatelessWidget {
  const NewAddedImageLog({super.key});

  @override
  Widget build(BuildContext context) {
     final logs = Get.put(LogsData());

    if (logs.newImageLog.isEmpty) {
      return const Center(child: Text('No logs available'));
    }

    return ListView.builder(
      itemCount: logs.newLogs.length,
      itemBuilder: (context, index) {
        return NewLogTab(
          createdAt: "${(logs.newLogs[logs.newLogs.length - 1 - index].createdAt)}",
            size: "${(logs.newLogs[logs.newLogs.length - 1 - index].size)}MB",
            image:
                logs.newLogs[logs.newLogs.length - 1 - index].image);
      },
    );
  }
}