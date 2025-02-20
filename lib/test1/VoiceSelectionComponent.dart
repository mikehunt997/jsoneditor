import 'package:flutter/material.dart';

class VoiceSelectionComponent extends StatelessWidget {
  final List<String> voiceOptions;

  const VoiceSelectionComponent({
    Key? key,
    this.voiceOptions = const ['Royal sister', 'Royal sister', 'Royal sister', 'Royal sister', 'Royal sister', 'Royal sister'],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Tap to select and preview the pre-recorded audio.',
            style: TextStyle(
              fontFamily: 'Kumbh Sans',
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF939393),
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: List.generate(voiceOptions.length, (index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      // Handle voice selection
                    },
                    child: Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Color(0xFF939393),
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Image.network(
                          'https://dashboard.codeparrot.ai/api/image/Z6c1n6QaAZs3c_oK/group-12-${index + 6}.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    voiceOptions[index],
                    style: TextStyle(
                      fontFamily: 'Kumbh Sans',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF636363),
                      height: 1.3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

