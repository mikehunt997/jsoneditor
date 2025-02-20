import 'package:flutter/material.dart';

class CharacterSettingsComponent extends StatefulWidget {
  final String initialFirstMessage;
  final String initialIntroduction;
  final String initialHabits;

  const CharacterSettingsComponent({
    Key? key,
    this.initialFirstMessage = '',
    this.initialIntroduction = '',
    this.initialHabits = '',
  }) : super(key: key);

  @override
  _CharacterSettingsComponentState createState() => _CharacterSettingsComponentState();
}

class _CharacterSettingsComponentState extends State<CharacterSettingsComponent> {
  late TextEditingController _firstMessageController;
  late TextEditingController _introductionController;
  late TextEditingController _habitsController;

  @override
  void initState() {
    super.initState();
    _firstMessageController = TextEditingController(text: widget.initialFirstMessage);
    _introductionController = TextEditingController(text: widget.initialIntroduction);
    _habitsController = TextEditingController(text: widget.initialHabits);
  }

  @override
  void dispose() {
    _firstMessageController.dispose();
    _introductionController.dispose();
    _habitsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth * 0.9,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Character settings',
                style: TextStyle(
                  fontFamily: 'Kumbh Sans',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E1E1E),
                ),
              ),
              SizedBox(height: 20),
              _buildInputField(
                controller: _firstMessageController,
                hintText: "E.g.Honey! What is weighing on your mind?",
                maxLength: 500,
                height: 70,
              ),
              SizedBox(height: 20),
              Text(
                'Character Introduction*',
                style: TextStyle(
                  fontFamily: 'Kumbh Sans',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 10),
              _buildInputField(
                controller: _introductionController,
                hintText: "Please enter the character's personality, growth experience, background description, etc.",
                maxLength: 2000,
                height: 92,
              ),
              SizedBox(height: 20),
              Text(
                'Character Habits & Behaviors',
                style: TextStyle(
                  fontFamily: 'Kumbh Sans',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E1E1E),
                ),
              ),
              SizedBox(height: 10),
              _buildInputField(
                controller: _habitsController,
                hintText: "",
                maxLength: 2000,
                height: 92,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required int maxLength,
    required double height,
  }) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Color(0xFF939393),
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          TextField(
            controller: controller,
            maxLength: maxLength,
            maxLines: null,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontFamily: 'Kumbh Sans',
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF939393),
              ),
              contentPadding: EdgeInsets.all(15),
              border: InputBorder.none,
              counterText: '',
            ),
          ),
          Positioned(
            right: 10,
            bottom: 5,
            child: Text(
              '${controller.text.length}/$maxLength',
              style: TextStyle(
                fontFamily: 'Kumbh Sans',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFFCCCCCC),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

