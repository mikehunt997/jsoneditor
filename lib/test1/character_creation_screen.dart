import 'package:flutter/material.dart';
import './HeaderComponent.dart';
import './ProgressIndicatorComponent.dart';
import './ProfilePictureComponent.dart';
import './ActionButtonsComponent.dart';
import './VoiceSelectionComponent.dart';
import './ContinueButtonComponent.dart';

class CharacterCreationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F3F3),
      body: SafeArea(
        child: Column(
          children: [
            HeaderComponent(),
            SizedBox(height: 20),
            ProgressIndicatorComponent(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProfilePictureComponent(),
                    SizedBox(height: 20),
                    ActionButtonsComponent(),
                    SizedBox(height: 20),
                    VoiceSelectionComponent(),
                  ],
                ),
              ),
            ),
            ContinueButtonComponent(),
          ],
        ),
      ),
    );
  }
}
