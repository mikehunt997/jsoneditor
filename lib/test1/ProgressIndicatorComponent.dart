import 'package:flutter/material.dart';

class ProgressIndicatorComponent extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final double barWidth;
  final double barHeight;
  final double barSpacing;

  const ProgressIndicatorComponent({
    Key? key,
    this.currentStep = 2, // Default to step 2 based on the design
    this.totalSteps = 4,  // Total 4 bars shown in the design
    this.barWidth = 82.0, // From Figma specs
    this.barHeight = 3.0, // From Figma specs
    this.barSpacing = 5.0, // Space between bars
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate responsive bar width if screen is too narrow
        double availableWidth = constraints.maxWidth - 30; // Account for padding
        double totalSpacing = barSpacing * (totalSteps - 1);
        double calculatedBarWidth = (availableWidth - totalSpacing) / totalSteps;
        double actualBarWidth = calculatedBarWidth < barWidth 
            ? calculatedBarWidth 
            : barWidth;

        return Container(
          width: double.infinity,
          height: 40, // Height for the progress bars and padding
          padding: const EdgeInsets.symmetric(horizontal: 15),
          color: Colors.transparent, // Inherits parent background
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(totalSteps, (index) {
                bool isActive = index < currentStep;
                return Row(
                  children: [
                    Container(
                      width: actualBarWidth,
                      height: barHeight,
                      decoration: BoxDecoration(
                        color: isActive 
                            ? const Color(0xFFBE5EFF) // Active color from Figma
                            : const Color(0xFFCCCCCC), // Inactive color from Figma
                        borderRadius: BorderRadius.circular(1.5), // From Figma
                      ),
                    ),
                    if (index < totalSteps - 1)
                      SizedBox(width: barSpacing),
                  ],
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
