import 'package:flutter/material.dart';

class JsonEditor extends StatefulWidget {
  final Map<String, dynamic> initialValue;
  final ValueChanged<Map<String, dynamic>>? onChanged;

  const JsonEditor({
    Key? key,
    required this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  State<JsonEditor> createState() => _JsonEditorState();
}

class _JsonEditorState extends State<JsonEditor> {
  late Map<String, dynamic> jsonData;

  @override
  void initState() {
    super.initState();
    jsonData = Map<String, dynamic>.from(widget.initialValue);
  }

  void updateValue(List<String> path, dynamic newValue) {
    setState(() {
      var current = jsonData;
      for (var i = 0; i < path.length - 1; i++) {
        current = current[path[i]];
      }
      current[path.last] = newValue;
      widget.onChanged?.call(jsonData);
    });
  }

  Widget renderValue(dynamic value, List<String> path) {
    if (value == null) {
      return renderNull(path);
    }

    if (value is Map) {
      return renderObject(value.cast<String, dynamic>(), path);
    }

    if (value is List) {
      return renderArray(value, path);
    }

    if (value is String) {
      return renderString(value, path);
    }

    if (value is num) {
      return renderNumber(value, path);
    }

    if (value is bool) {
      return renderBoolean(value, path);
    }

    return const Text('Unsupported type');
  }

  Widget renderString(String value, List<String> path) {
    return TextFormField(
      initialValue: value,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),
      onChanged: (newValue) => updateValue(path, newValue),
    );
  }

  Widget renderNumber(num value, List<String> path) {
    return TextFormField(
      initialValue: value.toString(),
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),
      onChanged: (newValue) {
        final number = num.tryParse(newValue);
        if (number != null) {
          updateValue(path, number);
        }
      },
    );
  }

  Widget renderBoolean(bool value, List<String> path) {
    return DropdownButton<bool>(
      value: value,
      items: const [
        DropdownMenuItem(value: true, child: Text('true')),
        DropdownMenuItem(value: false, child: Text('false')),
      ],
      onChanged: (newValue) {
        if (newValue != null) {
          updateValue(path, newValue);
        }
      },
    );
  }

  Widget renderNull(List<String> path) {
    return const Text('null');
  }

  Widget renderObject(Map<String, dynamic> obj, List<String> path) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...obj.entries.map((entry) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      initialValue: entry.key,
                      decoration: const InputDecoration(
                        labelText: '键',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      ),
                      onChanged: (newKey) {
                        if (newKey != entry.key) {
                          setState(() {
                            final value = obj.remove(entry.key);
                            obj[newKey] = value;
                            widget.onChanged?.call(jsonData);
                          });
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 3,
                    child: renderValue(entry.value, [...path, entry.key]),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        obj.remove(entry.key);
                        widget.onChanged?.call(jsonData);
                      });
                    },
                  ),
                ],
              ),
            )).toList(),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  obj['新字段'] = '';
                  widget.onChanged?.call(jsonData);
                });
              },
              child: const Text('添加字段'),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderArray(List value, List<String> path) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ...value.asMap().entries.map((entry) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40,
                    child: Text('[${entry.key}]'),
                  ),
                  Expanded(
                    child: renderValue(entry.value, [...path, entry.key.toString()]),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        value.removeAt(entry.key);
                        widget.onChanged?.call(jsonData);
                      });
                    },
                  ),
                ],
              ),
            )).toList(),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  value.add('');
                  widget.onChanged?.call(jsonData);
                });
              },
              child: const Text('添加项'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: renderValue(jsonData, []),
      ),
    );
  }
} 