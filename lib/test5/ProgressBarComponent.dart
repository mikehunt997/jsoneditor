import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressBarComponent extends StatelessWidget {
  final double progress;
  final int current;
  final int total;

  const ProgressBarComponent({
    Key? key,
    this.progress = 0.7, // 70%
    this.current = 14,
    this.total = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 42.h,
      decoration: BoxDecoration(
        color: Color(0xFFD9A2FF),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15.r),
            bottomRight: Radius.circular(15.r)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 21.w,
                height: 21.h,
                decoration: BoxDecoration(
                  color: Color(0x801E1E1E),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                'Mutual',
                style: TextStyle(
                  fontFamily: 'Kumbh Sans',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1E1E1E),
                  height: 1.3,
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                'Friend',
                style: TextStyle(
                  fontFamily: 'Kumbh Sans',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0x801E1E1E),
                  height: 1.3,
                ),
              ),
            ],
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.5.r),
                child: Container(
                  width: 140.w,
                  height: 12.h,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Container(
                        width: (140 * progress).w,
                        height: 12.h,
                        decoration: BoxDecoration(
                          color: Color(0x80D9A2FF),
                        ),
                      ),
                      Center(
                        child: Text(
                          '${(progress * 100).toInt()}%',
                          style: TextStyle(
                            fontFamily: 'Kumbh Sans',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF636363),
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Text(
                '$current/$total',
                style: TextStyle(
                  fontFamily: 'Kumbh Sans',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E1E1E),
                  height: 1.3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
