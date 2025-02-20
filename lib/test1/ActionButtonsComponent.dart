import 'package:flutter/material.dart';

class ActionButtonsComponent extends StatelessWidget {
  final VoidCallback? onAIGenerate;
  final VoidCallback? onUploadPhoto;

  const ActionButtonsComponent({
    Key? key,
    this.onAIGenerate,
    this.onUploadPhoto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButton(
            text: 'AI Generate',
            onPressed: onAIGenerate ?? () {},
            context: context,
          ),
          _buildButton(
            text: 'Upload photo',
            onPressed: onUploadPhoto ?? () {},
            context: context,
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required VoidCallback onPressed,
    required BuildContext context,
  }) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 150,
        maxWidth: MediaQuery.of(context).size.width * 0.4,
        minHeight: 30,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1E1E1E),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.zero,
          elevation: 0,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1.3,
          ),
        ),
      ),
    );
  }
}
