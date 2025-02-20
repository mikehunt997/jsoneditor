import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImportantMemoryComponent extends StatelessWidget {
  final String title;
  final List<Map<String, String>> memories;

  const ImportantMemoryComponent({
    Key? key,
    this.title = 'Important Memory (3)',
    this.memories = const [
      {
        'date': 'Toady',
        'text':
            "Oh, darling, I've been waiting for you.I missed you so much. Did you have a good day?",
        'icon':
            'https://dashboard.codeparrot.ai/api/image/Z6liS4cVzJUvTtxN/group-12-3.png'
      },
      {
        'date': '04 Dec',
        'text':
            "Oh, darling, I've been waiting for you.I missed you so much. Did you have a good day? Oh, darling, I've been waiting for you.I missed you so much. Did you have a good day?",
        'icon':
            'https://dashboard.codeparrot.ai/api/image/Z6liS4cVzJUvTtxN/group-12-5.png'
      }
    ],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      color: Color(0xFFF3F3F3),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Kumbh Sans',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E1E1E),
            ),
          ),
          SizedBox(height: 20.w),
          ...memories.map((memory) => _buildMemoryItem(memory)).toList(),
        ],
      ),
    );
  }

  Widget _buildMemoryItem(Map<String, String> memory) {
    return Container(
      padding: EdgeInsets.only(left: 19.w),
      decoration: BoxDecoration(
          border: Border(
        left: BorderSide(
          color: Color(0xffDEDEDE),
          width: 1.w,
        ),
      )),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(15.w),
            margin: EdgeInsets.only(bottom: 20.w, top: 12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Text(
              memory['text']!,
              style: TextStyle(
                fontFamily: 'Kumbh Sans',
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1E1E1E),
                height: 1.54,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 15.w,
            child: Image.network(
              memory['icon']!,
              width: 24.w,
              height: 24.w,
            ),
          ),
        ],
      ),
    );
  }
}
