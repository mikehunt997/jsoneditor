import 'package:flutter/material.dart';

class StringEditor extends StatefulWidget {
  final String value;
  final ValueChanged<String> onChanged;

  const StringEditor({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<StringEditor> createState() => _StringEditorState();
}

class _StringEditorState extends State<StringEditor> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    _controller.selection =
        TextSelection.collapsed(offset: widget.value.length);
    _controller.addListener(_handleTextChange);
    _focusNode = FocusNode();

    // 添加焦点监听器来调试焦点状态
    _focusNode.addListener(() {
      print('Focus state changed: ${_focusNode.hasFocus}');
    });
  }

  @override
  void didUpdateWidget(StringEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _controller.text) {
      _controller.text = widget.value;
      _controller.selection =
          TextSelection.collapsed(offset: widget.value.length);
    }
  }

  void _handleTextChange() {
    if (_controller.text != widget.value) {
      widget.onChanged(_controller.text);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTextChange);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        ),
        onTap: () {
          print('onTap');
          //delay 100ms to ensure the focusNode is focused
          Future.delayed(const Duration(milliseconds: 200), () {
            _focusNode.requestFocus();
          });
        },
      ),
    );
  }
}
