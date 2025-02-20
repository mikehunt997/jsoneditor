import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'header_component.dart';
import 'memory_description_component.dart';
import 'important_memory_component.dart';
import 'memory_entry_component.dart';

class MemoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F3F3),
      body: SafeArea(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderComponent(),
              SizedBox(height: 20.h),
              MemoryDescriptionComponent(),
              SizedBox(height: 20.h),
              ImportantMemoryComponent(),
              SizedBox(height: 10.h), // Added spacing for better alignment
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'Toady',
                  style: TextStyle(
                    fontFamily: 'Kumbh Sans',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                    color: const Color(0xFF1E1E1E),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    MemoryEntryComponent(),
                    MemoryEntryComponent(),
                    MemoryEntryComponent(
                      date: '04 Dec',
                      message: "Oh, darling, I've been waiting for you. I missed you so much. Did you have a good day? Oh, darling, I've been waiting for you. I missed you so much. Did you have a good day?",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
