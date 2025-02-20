import 'package:flutter/material.dart';
import '../widgets/json_editor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JsonEditorPage extends StatefulWidget {
  const JsonEditorPage({Key? key}) : super(key: key);

  @override
  State<JsonEditorPage> createState() => _JsonEditorPageState();
}

class _JsonEditorPageState extends State<JsonEditorPage> {
  final Map<String, dynamic> sampleJson = {
    // "name": "张三",
    // "age": 25,
    // "isStudent": true,
    // "hobbies": ["读书", "游戏", "运动"],
    // "address": {"city": "北京", "street": "朝阳区"}
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.jsonEditor),
      ),
      body: JsonEditor(
        initialValue: sampleJson,
        onChanged: (newValue) {
          print('JSON 已更新: $newValue');
        },
      ),
    );
  }
}
