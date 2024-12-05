import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'location_edit_widget.dart' show LocationEditWidget;
import 'package:flutter/material.dart';

class LocationEditModel extends FlutterFlowModel<LocationEditWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TitleLocation widget.
  FocusNode? titleLocationFocusNode;
  TextEditingController? titleLocationTextController;
  String? Function(BuildContext, String?)? titleLocationTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for addressLocation widget.
  final addressLocationKey = GlobalKey();
  FocusNode? addressLocationFocusNode;
  TextEditingController? addressLocationTextController;
  String? addressLocationSelectedOption;
  String? Function(BuildContext, String?)?
      addressLocationTextControllerValidator;
  // Stores action output result for [Backend Call - API (autocomplete maps)] action in addressLocation widget.
  ApiCallResponse? location;
  // State field(s) for linksocial widget.
  FocusNode? linksocialFocusNode;
  TextEditingController? linksocialTextController;
  String? Function(BuildContext, String?)? linksocialTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleLocationFocusNode?.dispose();
    titleLocationTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    addressLocationFocusNode?.dispose();

    linksocialFocusNode?.dispose();
    linksocialTextController?.dispose();
  }
}
