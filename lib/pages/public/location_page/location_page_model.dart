import '/components/nav_nuova/nav_nuova_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'location_page_widget.dart' show LocationPageWidget;
import 'package:flutter/material.dart';

class LocationPageModel extends FlutterFlowModel<LocationPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavNuova component.
  late NavNuovaModel navNuovaModel;

  @override
  void initState(BuildContext context) {
    navNuovaModel = createModel(context, () => NavNuovaModel());
  }

  @override
  void dispose() {
    navNuovaModel.dispose();
  }
}
