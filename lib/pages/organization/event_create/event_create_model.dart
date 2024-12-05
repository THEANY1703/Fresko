import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'event_create_widget.dart' show EventCreateWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventCreateModel extends FlutterFlowModel<EventCreateWidget> {
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
  // Stores action output result for [Firestore Query - Query a collection] action in LocationDropDown widget.
  LocationRecord? locationReference;
  // State field(s) for TagDropDown widget.
  String? tagDropDownValue;
  FormFieldController<String>? tagDropDownValueController;
  List<TagRecord>? tagDropDownPreviousSnapshot;
  // Stores action output result for [Firestore Query - Query a collection] action in TagDropDown widget.
  TagRecord? tagSelected;
  // State field(s) for linksocial widget.
  FocusNode? linksocialFocusNode;
  TextEditingController? linksocialTextController;
  String? Function(BuildContext, String?)? linksocialTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Confirmation widget.
  EventRecord? eventCreated;

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
