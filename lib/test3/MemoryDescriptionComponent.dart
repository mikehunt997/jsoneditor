import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemoryDescriptionComponent extends StatelessWidget {
  final String description;

  const MemoryDescriptionComponent({
    Key? key,
    this.description = 'The memory records a summary of the conversations\n'
        'you\'ve had with the character.\n'
        'If a topic related to a previous conversation comes up, you can refer to the memory.\n'
        'Manage your memory through important memory settings, memory editing and deletion, optimization, etc.',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        width: 345.w,
        constraints: BoxConstraints(
          minHeight: 132.w,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.w),
          child: Text(
            description,
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: 'Kumbh Sans',
              fontWeight: FontWeight.w500,
              color: Color(0xFF939393),
              height: 1.4,
            ),
          ),
        ),
      ),
    );
  }
}
