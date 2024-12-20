import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'event_edit_widget.dart' show EventEditWidget;
import 'package:flutter/material.dart';

class EventEditModel extends FlutterFlowModel<EventEditWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for dispalyTitle widget.
  FocusNode? dispalyTitleFocusNode;
  TextEditingController? dispalyTitleTextController;
  String? Function(BuildContext, String?)? dispalyTitleTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for LocationDropDown widget.
  String? locationDropDownValue;
  FormFieldController<String>? locationDropDownValueController;
  List<LocationRecord>? locationDropDownPreviousSnapshot;
  // State field(s) for TagDropDown widget.
  String? tagDropDownValue;
  FormFieldController<String>? tagDropDownValueController;
  List<EventTagsRecord>? tagDropDownPreviousSnapshot;
  // Stores action output result for [Firestore Query - Query a collection] action in TagDropDown widget.
  TagRecord? tagSelected;
  // State field(s) for linksocial widget.
  FocusNode? linksocialFocusNode;
  TextEditingController? linksocialTextController;
  String? Function(BuildContext, String?)? linksocialTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Confirmation widget.
  LocationRecord? locationRef;
  // Stores action output result for [Firestore Query - Query a collection] action in Confirmation widget.
  EventTagsRecord? selected;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    dispalyTitleFocusNode?.dispose();
    dispalyTitleTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    linksocialFocusNode?.dispose();
    linksocialTextController?.dispose();
  }
}
