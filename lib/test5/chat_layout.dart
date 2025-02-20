import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'HeaderComponent.dart';
import 'ProgressBarComponent.dart';
import 'ChatBubbleComponent.dart';
import 'InputFieldComponent.dart';
import 'FooterComponent.dart';

class ChatLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        constraints: BoxConstraints(
          minHeight: 1.sh,
        ),
        decoration: BoxDecoration(
          color: Color(0xFFF3F3F3),
        ),
        child: Column(
          children: [
            HeaderComponent(),
            ProgressBarComponent(),
            Expanded(
              child: ListView(
                children: [
                  ChatBubbleComponent(),
                  ChatBubbleComponent(
                    message: "Oh, darling, I've been waiting for you.I missed you so much. Did you have a good day?",
                    time: "19.44",
                    senderName: "",
                    avatarUrl: "https://dashboard.codeparrot.ai/api/image/Z6xO7FAi2iW5lX3F/mask-gro-2.png",
                    isOwnMessage: true,
                  ),
                ],
              ),
            ),
            InputFieldComponent(),
            FooterComponent(),
          ],
        ),
      ),
    );
  }
}

