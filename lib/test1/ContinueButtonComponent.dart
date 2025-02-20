import 'package:flutter/material.dart';

class ContinueButtonComponent extends StatelessWidget {
  final VoidCallback? onPressed;

  const ContinueButtonComponent({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth * 0.9, // Responsive width
            height: 48,
            child: ElevatedButton(
              onPressed: onPressed ?? () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA022F5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
                elevation: 0,
              ),
              child: const Text(
                'Continue',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Kumbh Sans',
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
