import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'organizer_create_list_widget.dart' show OrganizerCreateListWidget;
import 'package:flutter/material.dart';

class OrganizerCreateListModel
    extends FlutterFlowModel<OrganizerCreateListWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> prEditor = [];
  void addToPrEditor(DocumentReference item) => prEditor.add(item);
  void removeFromPrEditor(DocumentReference item) => prEditor.remove(item);
  void removeAtIndexFromPrEditor(int index) => prEditor.removeAt(index);
  void insertAtIndexInPrEditor(int index, DocumentReference item) =>
      prEditor.insert(index, item);
  void updatePrEditorAtIndex(int index, Function(DocumentReference) updateFn) =>
      prEditor[index] = updateFn(prEditor[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for dispalyTitle widget.
  FocusNode? dispalyTitleFocusNode;
  TextEditingController? dispalyTitleTextController;
  String? Function(BuildContext, String?)? dispalyTitleTextControllerValidator;
  // State field(s) for EventDropDown widget.
  String? eventDropDownValue;
  FormFieldController<String>? eventDropDownValueController;
  List<EventRecord>? eventDropDownPreviousSnapshot;
  // Stores action output result for [Firestore Query - Query a collection] action in EventDropDown widget.
  EventRecord? eventSelected;
  // State field(s) for SelectPr widget.
  final selectPrKey = GlobalKey();
  FocusNode? selectPrFocusNode;
  TextEditingController? selectPrTextController;
  String? selectPrSelectedOption;
  String? Function(BuildContext, String?)? selectPrTextControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in SelectPr widget.
  UserRecord? prSelected;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    dispalyTitleFocusNode?.dispose();
    dispalyTitleTextController?.dispose();

    selectPrFocusNode?.dispose();
  }
}
