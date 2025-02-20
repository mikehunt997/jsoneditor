import 'package:flutter/material.dart';

class ActionButtonsComponent extends StatelessWidget {
  final String addButtonText;
  final String continueButtonText;
  final VoidCallback onAddButtonPressed;
  final VoidCallback onContinueButtonPressed;

  const ActionButtonsComponent({
    Key? key,
    this.addButtonText = '+Add information(2/5)',
    this.continueButtonText = 'Continue',
    required this.onAddButtonPressed,
    required this.onContinueButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      color: const Color(0xFFF3F3F3), // Inheriting parent background color
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 172,
            height: 36,
            margin: const EdgeInsets.only(bottom: 16),
            child: ElevatedButton(
              onPressed: onAddButtonPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E1E1E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.zero,
                elevation: 0,
              ),
              child: Text(
                addButtonText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
              ),
            ),
          ),
          Container(
            width: 345,
            height: 48,
            child: ElevatedButton(
              onPressed: onContinueButtonPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA022F5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: EdgeInsets.zero,
                elevation: 0,
              ),
              child: Text(
                continueButtonText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Kumbh Sans',
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

