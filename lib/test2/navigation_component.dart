import 'package:flutter/material.dart';

class NavigationComponent extends StatelessWidget {
  final String title;
  final List<bool> progressIndicators;

  const NavigationComponent({
    Key? key,
    this.title = 'Create a Character',
    this.progressIndicators = const [true, true, true, false],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 58, 15, 20),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                'https://dashboard.codeparrot.ai/api/image/Z6c5qqQaAZs3c_oM/group-12.png',
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Kumbh Sans',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E1E1E),
                    height: 1.3,
                  ),
                ),
              ),
              SizedBox(width: 24), // Balance the layout with back button
            ],
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: progressIndicators.map((isActive) => _buildProgressIndicator(isActive)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator(bool isActive) {
    return Container(
      width: 82,
      height: 3,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFBE5EFF) : const Color(0xFFCCCCCC),
        borderRadius: BorderRadius.circular(1.5),
      ),
    );
  }
}

