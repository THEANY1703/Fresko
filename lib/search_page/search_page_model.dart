import '/backend/backend.dart';
import '/components/nav_nuova/nav_nuova_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'search_page_widget.dart' show SearchPageWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPageModel extends FlutterFlowModel<SearchPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Algolia Search Results from action on TextField
  List<EventRecord>? algoliaSearchResults = [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  DateTime? datePicked;
  // Model for NavNuova component.
  late NavNuovaModel navNuovaModel;

  @override
  void initState(BuildContext context) {
    navNuovaModel = createModel(context, () => NavNuovaModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();

    navNuovaModel.dispose();
  }
}
