import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'organization_create_widget.dart' show OrganizationCreateWidget;
import 'package:flutter/material.dart';

class OrganizationCreateModel
    extends FlutterFlowModel<OrganizationCreateWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for dispalyTitle widget.
  FocusNode? dispalyTitleFocusNode;
  TextEditingController? dispalyTitleTextController;
  String? Function(BuildContext, String?)? dispalyTitleTextControllerValidator;
  // State field(s) for biography widget.
  FocusNode? biographyFocusNode;
  TextEditingController? biographyTextController;
  String? Function(BuildContext, String?)? biographyTextControllerValidator;
  // State field(s) for linksocial widget.
  FocusNode? linksocialFocusNode;
  TextEditingController? linksocialTextController;
  String? Function(BuildContext, String?)? linksocialTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Confirmation widget.
  OrganizationRecord? organizationCreate;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    dispalyTitleFocusNode?.dispose();
    dispalyTitleTextController?.dispose();

    biographyFocusNode?.dispose();
    biographyTextController?.dispose();

    linksocialFocusNode?.dispose();
    linksocialTextController?.dispose();
  }
}
