import 'package:flutter/material.dart';
import '../widgets/json_editor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JsonEditorPage extends StatefulWidget {
  final Function(Locale) onLocaleChange; // 添加语言切换回调
  final Locale currentLocale;

  const JsonEditorPage({
    Key? key,
    required this.onLocaleChange,
    required this.currentLocale,
  }) : super(key: key);

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
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.jsonEditor),
        actions: [
          // 添加语言切换按钮
          PopupMenuButton<String>(
            icon: const Icon(Icons.language),
            onSelected: (String value) {
              widget.onLocaleChange(Locale(value));
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'en',
                child: Text('English'),
              ),
              const PopupMenuItem<String>(
                value: 'zh',
                child: Text('中文'),
              ),
            ],
          ),
        ],
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
