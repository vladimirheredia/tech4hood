import 'package:flutter/material.dart';
import 'package:tech4hood/components/notification_panel.dart';

class BasePageMixin {

  String errorNotification;

  Widget handleDataFetchingProgress() {
    return Center(
      child: errorNotification != null ? NotificationPanel(notificationMessage: errorNotification) :
      CircularProgressIndicator()
    );
  }
}