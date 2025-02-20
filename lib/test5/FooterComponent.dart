import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FooterComponent extends StatelessWidget {
  const FooterComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 90.h,
      color: Color(0xFFF3F3F3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFooterItem('https://dashboard.codeparrot.ai/api/image/Z6xO7FAi2iW5lX3F/group-12-6.png', 'Memories'),
              _buildFooterItem('https://dashboard.codeparrot.ai/api/image/Z6xO7FAi2iW5lX3F/group-12-5.png', 'Situation'),
              _buildFooterItem('https://dashboard.codeparrot.ai/api/image/Z6xO7FAi2iW5lX3F/group-12-7.png', 'Event'),
            ],
          ),
          SizedBox(height: 10.h),
          Container(
            width: 100.w,
            height: 4.h,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildFooterItem(String iconPath, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40.w,
          height: 40.h,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(20.r),
              child: SvgPicture.network(
                iconPath,
                width: 40.w,
                height: 40.h,
              ),
            ),
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Kumbh Sans',
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1E1E1E),
            height: 1.8,
          ),
        ),
      ],
    );
  }
}

