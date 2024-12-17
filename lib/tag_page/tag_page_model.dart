import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'tag_page_widget.dart' show TagPageWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class TagPageModel extends FlutterFlowModel<TagPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  TagRecord? selected;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
