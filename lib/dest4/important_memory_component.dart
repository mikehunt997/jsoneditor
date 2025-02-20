import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImportantMemoryComponent extends StatelessWidget {
  final String title;

  const ImportantMemoryComponent({
    Key? key,
    this.title = 'Important Memory (3)',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      width: double.infinity,
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Kumbh Sans',
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          height: 1.3,
          color: const Color(0xFF1E1E1E),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

