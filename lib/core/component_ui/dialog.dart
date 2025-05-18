import 'package:flutter/material.dart';
import 'package:mini_chat_app/routes.dart';

class DialogMiniChat {
  static showLoadingDialog() {
    showDialog(
      context: AppRouter.context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Center(
            child: CircularProgressIndicator(color: Colors.white,),
          ),
        );
      },
    );
  }
}