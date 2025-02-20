import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputFieldComponent extends StatelessWidget {
  final Function(String)? onMessageSubmit;
  final TextEditingController? controller;

  const InputFieldComponent({
    Key? key,
    this.onMessageSubmit,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      color: Color(0xFFF3F3F3), // Inheriting parent background color
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 40.h,
              constraints: BoxConstraints(
                minWidth: 271.w,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: Color(0xFF939393),
                  width: 0.5,
                ),
              ),
              child: TextField(
                controller: controller,
                style: TextStyle(
                  fontFamily: 'Kumbh Sans',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter your message',
                  hintStyle: TextStyle(
                    fontFamily: 'Kumbh Sans',
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF939393),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 11.h,
                  ),
                  border: InputBorder.none,
                ),
                onSubmitted: onMessageSubmit,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://dashboard.codeparrot.ai/api/image/Z6xO7FAi2iW5lX3F/group-12-10.png'),
                fit: BoxFit.contain,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20.r),
                onTap: () {
                  if (controller?.text != null && onMessageSubmit != null) {
                    onMessageSubmit!(controller!.text);
                    controller!.clear();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

