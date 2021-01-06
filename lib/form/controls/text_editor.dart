import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../config/palette.dart';
import '../../datamodels/doctype_response.dart';

import 'base_control.dart';
import 'base_input.dart';

class TextEditor extends StatelessWidget with Control, ControlInput {
  final Key key;
  final DoctypeField doctypeField;
  final Map doc;

  final bool withLabel;

  const TextEditor({
    this.key,
    @required this.doctypeField,
    this.doc,
    this.withLabel,
  });

  @override
  Widget build(BuildContext context) {
    List<String Function(dynamic)> validators = [];

    validators.add(
      setMandatory(doctypeField, context),
    );
    return FormBuilderTextField(
      key: key,
      maxLines: 10,
      initialValue: doc[doctypeField.fieldname],
      name: doctypeField.fieldname,
      decoration: Palette.formFieldDecoration(
        withLabel,
        doctypeField.label,
      ),
      validator: FormBuilderValidators.compose(validators),
    );
  }
}
