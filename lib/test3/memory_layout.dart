import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'HeaderComponent.dart';
import 'MemoryDescriptionComponent.dart';
import 'ImportantMemoryComponent.dart';
import 'EditButtonComponent.dart';

class MemoryLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,

        // constraints: BoxConstraints(
        //   minHeight: 1.sh,
        // ),
        color: Color(0xFFF3F3F3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderComponent(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20.w),
                    MemoryDescriptionComponent(),
                    SizedBox(height: 20.w),
                    ImportantMemoryComponent(),
                    EditButtonComponent(
                      onPressed: () {
                        // Define your onPressed action here
                      },
                    ),
                    SizedBox(height: 20.w),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
