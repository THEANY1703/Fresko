import '/flutter_flow/flutter_flow_util.dart';
import 'register_page_widget.dart' show RegisterPageWidget;
import 'package:flutter/material.dart';

class RegisterPageModel extends FlutterFlowModel<RegisterPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for username widget.
  FocusNode? usernameFocusNode;
  TextEditingController? usernameTextController;
  String? Function(BuildContext, String?)? usernameTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode1;
  TextEditingController? phoneTextController1;
  String? Function(BuildContext, String?)? phoneTextController1Validator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode2;
  TextEditingController? phoneTextController2;
  String? Function(BuildContext, String?)? phoneTextController2Validator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for passwordconfirmation widget.
  FocusNode? passwordconfirmationFocusNode;
  TextEditingController? passwordconfirmationTextController;
  late bool passwordconfirmationVisibility;
  String? Function(BuildContext, String?)?
      passwordconfirmationTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordconfirmationVisibility = false;
  }

  @override
  void dispose() {
    usernameFocusNode?.dispose();
    usernameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneFocusNode1?.dispose();
    phoneTextController1?.dispose();

    phoneFocusNode2?.dispose();
    phoneTextController2?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    passwordconfirmationFocusNode?.dispose();
    passwordconfirmationTextController?.dispose();
  }
}
