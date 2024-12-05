import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'organizer_add_widget.dart' show OrganizerAddWidget;
import 'package:flutter/material.dart';

class OrganizerAddModel extends FlutterFlowModel<OrganizerAddWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for dispalyTitle widget.
  final dispalyTitleKey = GlobalKey();
  FocusNode? dispalyTitleFocusNode;
  TextEditingController? dispalyTitleTextController;
  String? dispalyTitleSelectedOption;
  String? Function(BuildContext, String?)? dispalyTitleTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Confirmation widget.
  UserRecord? userAdded;
  // Stores action output result for [Backend Call - Read Document] action in IconButton widget.
  UserRecord? userSelected;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    dispalyTitleFocusNode?.dispose();
  }
}
