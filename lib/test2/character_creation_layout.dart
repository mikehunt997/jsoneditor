import 'package:flutter/material.dart';
import 'navigation_component.dart';
import 'character_settings_component.dart';
import 'character_details_component.dart';
import 'action_buttons_component.dart';

class CharacterCreationLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        decoration: BoxDecoration(
          color: Color(0xFFF3F3F3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NavigationComponent(),
            Expanded(
              child: CharacterSettingsComponent(
                initialFirstMessage: "E.g.Honey! What is weighing on your mind?",
                initialIntroduction: "Please enter the character's personality, growth experience, background description, etc.",
                initialHabits: "-He calls me 'Princess' every time he addresses me.\n-Every time I say I'm tired, he hugs me tightly and buys me a red rose, my favorite.",
              ),
            ),
            Expanded(
              child: CharacterDetailsComponent(
                title: 'Character Details',
                subtitle: 'Please enter additional information for the character.',
                placeholder: "E.g.The character's secret crush.",
                counter: '0/100',
              ),
            ),
            ActionButtonsComponent(
              onAddButtonPressed: () {},
              onContinueButtonPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
