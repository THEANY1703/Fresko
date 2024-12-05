import '/flutter_flow/flutter_flow_util.dart';
import 'tag_create_widget.dart' show TagCreateWidget;
import 'package:flutter/material.dart';

class TagCreateModel extends FlutterFlowModel<TagCreateWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for dispalyTitle widget.
  FocusNode? dispalyTitleFocusNode;
  TextEditingController? dispalyTitleTextController;
  String? Function(BuildContext, String?)? dispalyTitleTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    dispalyTitleFocusNode?.dispose();
    dispalyTitleTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
