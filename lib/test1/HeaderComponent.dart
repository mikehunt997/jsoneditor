import 'package:flutter/material.dart';

class HeaderComponent extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;

  const HeaderComponent({
    Key? key,
    this.title = 'Create a Character',
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56, // Fixed height to ensure content fits
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.transparent, // Inherit parent background
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Back button
          GestureDetector(
            onTap: onBack ?? () => Navigator.pop(context),
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://dashboard.codeparrot.ai/api/image/Z6c1n6QaAZs3c_oK/group-12.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Kumbh Sans',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E1E1E),
                  height: 1.3, // lineHeight 130%
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // Placeholder with same width as back button for centering
          SizedBox(width: 24),
        ],
      ),
    );
  }
}

