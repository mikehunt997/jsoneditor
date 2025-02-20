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
    return Container(
      width: 345.w,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        description,
        style: TextStyle(
          fontSize: 12.sp,
          height: 1.4,
          color: const Color(0xFF939393),
          fontFamily: 'Kumbh Sans',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

