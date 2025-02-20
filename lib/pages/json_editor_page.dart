import 'package:flutter/material.dart';
import '../widgets/json_editor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JsonEditorPage extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  final Locale currentLocale;
  final bool isDarkMode; // 添加主题状态
  final VoidCallback onThemeToggle; // 添加主题切换回调

  const JsonEditorPage({
    Key? key,
    required this.onLocaleChange,
    required this.currentLocale,
    required this.isDarkMode,
    required this.onThemeToggle,
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
          // 添加主题切换按钮
          IconButton(
            icon: Icon(
              widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: widget.onThemeToggle,
            tooltip: widget.isDarkMode
                ? 'Switch to Light Mode'
                : 'Switch to Dark Mode',
          ),
          // 语言切换按钮
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
