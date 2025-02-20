import 'package:flutter/material.dart';

class CharacterDetailsComponent extends StatelessWidget {
  final String title;
  final String subtitle;
  final String placeholder;
  final String counter;

  const CharacterDetailsComponent({
    Key? key,
    this.title = 'Character Details',
    this.subtitle = 'Please enter additional information for the character.',
    this.placeholder = "E.g.The character's secret crush.",
    this.counter = '0/100',
  }) : super(key: key);

  Widget _buildInputSection({
    required String title,
    required String subtitle,
    required String placeholder,
    required String counter,
    double height = 48,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Kumbh Sans',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E1E1E),
          ),
        ),
        if (subtitle.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              subtitle,
              style: const TextStyle(
                fontFamily: 'Kumbh Sans',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF939393),
              ),
            ),
          ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: const Color(0xFF939393),
              width: 1,
            ),
          ),
          child: Stack(
            children: [
              TextField(
                maxLines: height > 48 ? null : 1,
                decoration: InputDecoration(
                  hintText: placeholder,
                  hintStyle: const TextStyle(
                    fontFamily: 'Kumbh Sans',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF939393),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 8,
                child: Text(
                  counter,
                  style: const TextStyle(
                    fontFamily: 'Kumbh Sans',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFCCCCCC),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth > 400 ? 355 : constraints.maxWidth * 0.9,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Kumbh Sans',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E1E1E),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInputSection(
                      title: 'Additional Information',
                      subtitle: subtitle,
                      placeholder: placeholder,
                      counter: counter,
                    ),
                    const SizedBox(height: 20),
                    _buildInputSection(
                      title: 'Additional content',
                      subtitle: '',
                      placeholder: "E.g.The character's secret crush is you. Although he appear indifferent on the surface, he actually care about you more than anyone else.",
                      counter: '0/1000',
                      height: 120,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInputSection(
                      title: 'Additional Information',
                      subtitle: subtitle,
                      placeholder: placeholder,
                      counter: counter,
                    ),
                    const SizedBox(height: 20),
                    _buildInputSection(
                      title: 'Additional content',
                      subtitle: '',
                      placeholder: "E.g.The character's secret crush is you. Although he appear indifferent on the surface, he actually care about you more than anyone else.",
                      counter: '0/1000',
                      height: 120,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

