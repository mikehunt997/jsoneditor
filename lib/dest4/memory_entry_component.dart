import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MemoryEntryComponent extends StatelessWidget {
  final String date;
  final String message;
  
  const MemoryEntryComponent({
    Key? key,
    this.date = "14 Dec",
    this.message = "Oh, darling, I've been waiting for you. I missed you so much. Did you have a good day?"
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 329.w,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 26.w, top: 8.h),
            child: Row(
              children: [
                SvgPicture.network(
                  'https://dashboard.codeparrot.ai/api/image/Z6loN4cVzJUvTtxU/group-12-3.png',
                  width: 24.w,
                  height: 24.h,
                ),
                SizedBox(width: 10.w),
                Text(
                  date,
                  style: TextStyle(
                    fontFamily: 'Kumbh Sans',
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1E1E1E),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Text(
              message,
              style: TextStyle(
                fontFamily: 'Kumbh Sans',
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF1E1E1E),
                height: 1.54, // 20px line height / 13px font size
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15.w, bottom: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    // Handle edit action
                  },
                  child: SvgPicture.network(
                    'https://dashboard.codeparrot.ai/api/image/Z6loN4cVzJUvTtxU/a-shapee.png',
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                SizedBox(width: 15.w),
                InkWell(
                  onTap: () {
                    // Handle delete action
                  },
                  child: SvgPicture.network(
                    'https://dashboard.codeparrot.ai/api/image/Z6loN4cVzJUvTtxU/group-12-6.png',
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

