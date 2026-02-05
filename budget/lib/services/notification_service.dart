import 'package:flutter/foundation.dart';

class NotificationService {
  static Future<void> sendGroupNotification({
    required String groupPk,
    required String message,
    required List<String> recipients,
  }) async {
    if (kDebugMode) {
      debugPrint('NotificationService (placeholder) -> group: ' +
          groupPk +
          ', message: ' +
          message +
          ', recipients: ' +
          recipients.join(','));
    }
  }

  static Future<int> getUnreadNotificationCount(String userEmail) async {
    if (kDebugMode) {
      debugPrint('NotificationService (placeholder) -> unread count request for ' + userEmail);
    }
    return 0;
  }
}
