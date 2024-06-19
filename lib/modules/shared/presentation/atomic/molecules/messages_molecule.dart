import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../entities/custom_message.dart';
import '../../entities/message_types.dart';

mixin Messages<T extends StatefulWidget> on State<T> {
  void showCustomMessage(CustomMessage customMessage) {
    switch (customMessage.messageType) {
      case MessageType.success:
        return showSuccess(customMessage.message);
      case MessageType.error:
        return showError(customMessage.message);
      case MessageType.info:
        return showInfo(customMessage.message);
      default:
        throw 'Unknown message type';
    }
  }

  void showError(String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(message: message),
    );
  }

  void showInfo(String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(message: message),
    );
  }

  void showSuccess(String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(message: message),
    );
  }
}
