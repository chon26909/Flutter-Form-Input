import 'package:flutter/material.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField(
      {super.key,
      bool initialValue = false,
      Widget? title,
      FormFieldSetter<bool>? onSaved,
      FormFieldValidator<bool>? validator})
      : super(
          onSaved: onSaved,
          initialValue: initialValue,
          validator: validator,
          builder: (field) => CheckboxListTile(
            title: title,
            value: field.value,
            onChanged: field.didChange,
            subtitle: field.hasError
                ? Text(
                    field.errorText ?? "",
                    style: const TextStyle(color: Colors.red),
                  )
                : const Text(""),
          ),
        );
}
