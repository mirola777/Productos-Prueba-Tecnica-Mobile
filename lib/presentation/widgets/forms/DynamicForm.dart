import 'package:flutter/material.dart';
import 'package:productos_prueba_tecnica_mobile/util/Parser.dart';
import 'package:productos_prueba_tecnica_mobile/util/constants/AppColors.dart';

class DynamicForm extends StatefulWidget {
  final List<Map<String, String?>> fields;
  final Function(Map<String, String>) onSubmit;

  const DynamicForm({super.key, required this.fields, required this.onSubmit});

  @override
  _DynamicFormState createState() => _DynamicFormState();
}

class _DynamicFormState extends State<DynamicForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();
    for (var field in widget.fields) {
      final defaultValue = Parser.parseString(field['value'] ?? '');

      _controllers[field['name']!] = TextEditingController(text: defaultValue);
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          ...widget.fields.map((field) {
            return _buildField(field);
          }),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _submit,
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  Widget _buildField(Map<String, String?> field) {
    final name = field['name']!;
    final type = field['type']!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: _controllers[name],
        style: const TextStyle(color: AppColors.text),
        decoration: InputDecoration(
          labelText: name.capitalize(),
          focusColor: AppColors.text,
          labelStyle: const TextStyle(color: AppColors.text),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.text),
          ),
          hoverColor: AppColors.text,
        ),
        cursorColor: AppColors.text,
        keyboardType: _getKeyboarType(type),
        validator: (value) {
          return _validateField(value, type);
        },
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final formData =
          _controllers.map((key, value) => MapEntry(key, value.text));

      widget.onSubmit(formData);
    }
  }

  String? _validateField(String? value, String type) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    }

    if (type == 'int' && int.tryParse(value) == null) {
      return 'Please enter a valid integer';
    }

    if (type == 'double' && double.tryParse(value) == null) {
      return 'Please enter a valid double';
    }

    return null;
  }

  TextInputType _getKeyboarType(String type) {
    switch (type) {
      case 'int':
        return const TextInputType.numberWithOptions(decimal: false);
      case 'double':
        return const TextInputType.numberWithOptions(decimal: true);
      default:
        return TextInputType.text;
    }
  }
}

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
