import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBubbleComponent extends StatelessWidget {
  final String message;
  final String time;
  final String senderName;
  final String avatarUrl;
  final bool isOwnMessage;

  const ChatBubbleComponent({
    Key? key,
    this.message = "*When his fingers lightly touch your skin, you feel a slight tremor in your heart, a unique sensation washing over you.*\n\nAnd in that moment, he too seems touched by your gaze and the strength within your vulnerability. \n\nYour anxiety and unease, your brave attitude towards illness, all evoke a sense of compassion in him.",
    this.time = "19.44",
    this.senderName = "Tingyuan",
    this.avatarUrl = "https://dashboard.codeparrot.ai/api/image/Z6xO7FAi2iW5lX3F/mask-gro.png",
    this.isOwnMessage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: isOwnMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isOwnMessage) ...[
            CircleAvatar(
              radius: 20.r,
              backgroundImage: NetworkImage(avatarUrl),
            ),
            SizedBox(width: 10.w),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment: isOwnMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                if (!isOwnMessage) ...[
                  Text(
                    senderName,
                    style: TextStyle(
                      fontFamily: 'Kumbh Sans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E1E1E),
                    ),
                  ),
                  SizedBox(height: 4.h),
                ],
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 250.w,
                    minWidth: 100.w,
                  ),
                  padding: EdgeInsets.all(15.w),
                  decoration: BoxDecoration(
                    color: isOwnMessage ? Color(0xFFF4E3FF) : Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    message,
                    style: TextStyle(
                      fontFamily: 'Kumbh Sans',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1E1E1E),
                      height: 1.38,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  time,
                  style: TextStyle(
                    fontFamily: 'Kumbh Sans',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1E1E1E),
                  ),
                ),
              ],
            ),
          ),
          if (isOwnMessage) ...[
            SizedBox(width: 10.w),
            CircleAvatar(
              radius: 20.r,
              backgroundImage: NetworkImage(avatarUrl),
            ),
          ],
        ],
      ),
    );
  }
}

