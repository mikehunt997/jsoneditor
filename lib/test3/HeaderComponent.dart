import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderComponent extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;

  const HeaderComponent({
    Key? key,
    this.title = 'Memory',
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 60.w,
      color: Color(0xFFF3F3F3),
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onBack ?? () => Navigator.pop(context),
            child: Container(
              width: 24.w,
              height: 24.w,
              child: Image.network(
                'https://dashboard.codeparrot.ai/api/image/Z6liS4cVzJUvTtxN/group-12.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Kumbh Sans',
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1E1E1E),
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
