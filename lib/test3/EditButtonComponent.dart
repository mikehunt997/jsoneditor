import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditButtonComponent extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const EditButtonComponent({
    Key? key,
    this.buttonText = 'Edit',
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      color: const Color(0xFFF3F3F3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://dashboard.codeparrot.ai/api/image/Z6liS4cVzJUvTtxN/frame-2.png',
            width: 20.w,
            height: 20.w,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 10.w),
          GestureDetector(
            onTap: onPressed,
            child: Container(
              width: 58.w,
              height: 28.w,
              decoration: BoxDecoration(
                color: const Color(0xFFFAE24C),
                borderRadius: BorderRadius.circular(14.5.r),
              ),
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: const Color(0xFF111111),
                    fontSize: 14.sp,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
