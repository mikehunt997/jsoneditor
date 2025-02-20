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
      dynamic current = jsonData;
      for (var i = 0; i < path.length - 1; i++) {
        if (current is List) {
          final index = int.tryParse(path[i]);
          if (index != null && index >= 0 && index < current.length) {
            current = current[index];
          } else {
            return;
          }
        } else if (current is Map) {
          current = current[path[i]];
        } else {
          return;
        }
      }

      final lastKey = path.last;
      if (current is List) {
        final index = int.tryParse(lastKey);
        if (index != null && index >= 0 && index < current.length) {
          current[index] = newValue;
        }
      } else if (current is Map<String, dynamic>) {
        current[lastKey] = newValue;
      }

      widget.onChanged?.call(jsonData);
    });
  }

  dynamic convertValueType(dynamic value, String newType) {
    switch (newType) {
      case 'string':
        return value?.toString() ?? '';
      case 'number':
        if (value is String) {
          return num.tryParse(value) ?? 0;
        }
        return value is num ? value : 0;
      case 'boolean':
        if (value is String) {
          return value.toLowerCase() == 'true';
        }
        return value is bool ? value : false;
      case 'array':
        return [];
      case 'object':
        return <String, dynamic>{};
      case 'null':
        return null;
      default:
        return value;
    }
  }

  Widget buildTypeSelector(dynamic value, List<String> path) {
    String currentType = 'string';
    if (value == null) {
      currentType = 'null';
    } else if (value is num) {
      currentType = 'number';
    } else if (value is bool) {
      currentType = 'boolean';
    } else if (value is List) {
      currentType = 'array';
    } else if (value is Map) {
      currentType = 'object';
    }

    return DropdownButton<String>(
      value: currentType,
      items: const [
        DropdownMenuItem(value: 'string', child: Text('字符串')),
        DropdownMenuItem(value: 'number', child: Text('数字')),
        DropdownMenuItem(value: 'boolean', child: Text('布尔')),
        DropdownMenuItem(value: 'array', child: Text('数组')),
        DropdownMenuItem(value: 'object', child: Text('对象')),
        DropdownMenuItem(value: 'null', child: Text('空值')),
      ],
      onChanged: (newType) {
        if (newType != null && newType != currentType) {
          updateValue(path, convertValueType(value, newType));
        }
      },
    );
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
            ...obj.entries
                .map((entry) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: TextFormField(
                                  initialValue: entry.key,
                                  decoration: const InputDecoration(
                                    labelText: '键',
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
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
                              buildTypeSelector(
                                  entry.value, [...path, entry.key]),
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
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child:
                                renderValue(entry.value, [...path, entry.key]),
                          ),
                        ],
                      ),
                    ))
                .toList(),
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
            ...value
                .asMap()
                .entries
                .map((entry) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 40,
                                child: Text('[${entry.key}]'),
                              ),
                              buildTypeSelector(
                                  entry.value, [...path, entry.key.toString()]),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    value.removeAt(entry.key);
                                    for (var i = entry.key;
                                        i < value.length;
                                        i++) {
                                      final currentPath = [
                                        ...path,
                                        i.toString()
                                      ];
                                      updateValue(currentPath, value[i]);
                                    }
                                    widget.onChanged?.call(jsonData);
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.only(left: 48.0),
                            child: renderValue(
                                entry.value, [...path, entry.key.toString()]),
                          ),
                        ],
                      ),
                    ))
                .toList(),
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
