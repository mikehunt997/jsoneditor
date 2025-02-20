import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderComponent extends StatelessWidget {
  final String title;
  final String messageCount;

  const HeaderComponent({
    Key? key,
    this.title = 'Long-Form',
    this.messageCount = '257',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 44.h,
      color: const Color(0xFFF3F3F3),
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.network(
            'https://dashboard.codeparrot.ai/api/image/Z6xO7FAi2iW5lX3F/group-12.png',
            width: 24.w,
            height: 24.h,
          ),
          Row(
            children: [
              Container(
                width: 120.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '💌',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF4B3430),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1E1E1E),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              SvgPicture.network(
                'https://dashboard.codeparrot.ai/api/image/Z6xO7FAi2iW5lX3F/group-12-2.png',
                width: 12.w,
                height: 12.h,
              ),
              SizedBox(width: 8.w),
              Container(
                width: 90.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: const Color(0xFF939393),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.network(
                      'https://dashboard.codeparrot.ai/api/image/Z6xO7FAi2iW5lX3F/mask-gro-3.png',
                      width: 24.w,
                      height: 24.h,
                    ),
                    Text(
                      messageCount,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF601493),
                      ),
                    ),
                    SvgPicture.network(
                      'https://dashboard.codeparrot.ai/api/image/Z6xO7FAi2iW5lX3F/group-12-12.png',
                      width: 20.w,
                      height: 20.h,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15.w),
              SvgPicture.network(
                'https://dashboard.codeparrot.ai/api/image/Z6xO7FAi2iW5lX3F/group-12-3.png',
                width: 24.w,
                height: 24.h,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

