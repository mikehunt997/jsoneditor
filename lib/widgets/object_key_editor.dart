import 'package:demo/util/l10n.dart';
import 'package:flutter/material.dart';

class ObjectKeyEditor extends StatefulWidget {
  final String initialKey;
  final dynamic value;
  final List<String> path;
  final Function(String oldKey, String newKey) onKeyChanged;
  final VoidCallback onDeletePressed;
  final Widget Function(dynamic value, List<String> path) buildTypeSelector;
  final Widget Function(dynamic value, List<String> path) renderValue;
  final Map<String, dynamic> jsonData;

  const ObjectKeyEditor({
    Key? key,
    required this.initialKey,
    required this.value,
    required this.path,
    required this.onKeyChanged,
    required this.onDeletePressed,
    required this.buildTypeSelector,
    required this.renderValue,
    required this.jsonData,
  }) : super(key: key);

  @override
  State<ObjectKeyEditor> createState() => _ObjectKeyEditorState();
}

class _ObjectKeyEditorState extends State<ObjectKeyEditor> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialKey);
  }

  @override
  void didUpdateWidget(ObjectKeyEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialKey != oldWidget.initialKey) {
      _controller.text = widget.initialKey;
    }
  }

  void _updateKey(String newKey) {
    if (newKey != widget.initialKey) {
      // 检查新的 key 是否已经存在
      final parentObject = _getParentObject();
      if (parentObject != null && parentObject.containsKey(newKey)) {
        // 如果 key 已存在，恢复原来的 key 并显示错误提示
        _controller.text = widget.initialKey;
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.duplicateKey),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
        return;
      }
      widget.onKeyChanged(widget.initialKey, newKey);
    }
  }

  Map<String, dynamic>? _getParentObject() {
    dynamic current = widget.path.isEmpty
        ? null
        : widget.path.fold<dynamic>(
            widget.jsonData, (obj, key) => obj is Map ? obj[key] : null);
    return current is Map<String, dynamic> ? current : null;
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: FocusScope(
                  onFocusChange: (v) {
                    print('onFocusChange: $v');
                    if (!v) {
                      _updateKey(_controller.text);
                    }
                  },
                  child: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.key,
                      border: const OutlineInputBorder(),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                    ),
                    onFieldSubmitted: _updateKey,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      child: widget.renderValue(
                          widget.value, [...widget.path, widget.initialKey]),
                    ),
                    const SizedBox(width: 8),
                    widget.buildTypeSelector(
                        widget.value, [...widget.path, widget.initialKey]),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: widget.onDeletePressed,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
