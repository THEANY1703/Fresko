import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'event_create_model.dart';
export 'event_create_model.dart';

class EventCreateWidget extends StatefulWidget {
  const EventCreateWidget({super.key});

  @override
  State<EventCreateWidget> createState() => _EventCreateWidgetState();
}

class _EventCreateWidgetState extends State<EventCreateWidget> {
  late EventCreateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventCreateModel());

    _model.dispalyTitleTextController ??= TextEditingController();
    _model.dispalyTitleFocusNode ??= FocusNode();

    _model.descriptionTextController ??= TextEditingController();
    _model.descriptionFocusNode ??= FocusNode();

    _model.linksocialTextController ??= TextEditingController();
    _model.linksocialFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        appBar: AppBar(
          backgroundColor: const Color(0xFF0F0F0E),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Crea evento',
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: ' Brigends Expanded',
                  color: FlutterFlowTheme.of(context).tertiary,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  useGoogleFonts: false,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.network(
                '',
              ).image,
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        _model.uploadedFileUrl,
                        width: 160.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          final selectedMedia = await selectMedia(
                            maxWidth: 1080.00,
                            maxHeight: 1350.00,
                            imageQuality: 100,
                            mediaSource: MediaSource.photoGallery,
                            multiImage: false,
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            safeSetState(() => _model.isDataUploading = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];

                            var downloadUrls = <String>[];
                            try {
                              selectedUploadedFiles = selectedMedia
                                  .map((m) => FFUploadedFile(
                                        name: m.storagePath.split('/').last,
                                        bytes: m.bytes,
                                        height: m.dimensions?.height,
                                        width: m.dimensions?.width,
                                        blurHash: m.blurHash,
                                      ))
                                  .toList();

                              downloadUrls = (await Future.wait(
                                selectedMedia.map(
                                  (m) async =>
                                      await uploadData(m.storagePath, m.bytes),
                                ),
                              ))
                                  .where((u) => u != null)
                                  .map((u) => u!)
                                  .toList();
                            } finally {
                              _model.isDataUploading = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              safeSetState(() {
                                _model.uploadedLocalFile =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl = downloadUrls.first;
                              });
                            } else {
                              safeSetState(() {});
                              return;
                            }
                          }
                        },
                        text: 'Inserisci locandina',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xC0CF3A0A),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Lato',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Titolo',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Lato',
                                color: FlutterFlowTheme.of(context).tertiary,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 20.0),
                            child: SizedBox(
                              width: 200.0,
                              child: TextFormField(
                                controller: _model.dispalyTitleTextController,
                                focusNode: _model.dispalyTitleFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: ' Brigends Expanded',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  hintText: 'Nome evento',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: const Color(0xFFA09F99),
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xFFD8D8DD),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: const Color(0xFFA09F99),
                                      letterSpacing: 0.0,
                                    ),
                                maxLines: null,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model
                                    .dispalyTitleTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Data',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Lato',
                                color: FlutterFlowTheme.of(context).tertiary,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 20.0),
                          child: Container(
                            height: 45.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD8D8DD),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      dateTimeFormat(
                                        "d/M/y",
                                        _model.datePicked,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FlutterFlowTheme.of(context)
                                                .accent2,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          30.0, 0.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await showModalBottomSheet<bool>(
                                              context: context,
                                              builder: (context) {
                                                final datePickedCupertinoTheme =
                                                    CupertinoTheme.of(context);
                                                return ScrollConfiguration(
                                                  behavior:
                                                      const MaterialScrollBehavior()
                                                          .copyWith(
                                                    dragDevices: {
                                                      PointerDeviceKind.mouse,
                                                      PointerDeviceKind.touch,
                                                      PointerDeviceKind.stylus,
                                                      PointerDeviceKind.unknown
                                                    },
                                                  ),
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            3,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    child: CupertinoTheme(
                                                      data:
                                                          datePickedCupertinoTheme
                                                              .copyWith(
                                                        textTheme:
                                                            datePickedCupertinoTheme
                                                                .textTheme
                                                                .copyWith(
                                                          dateTimePickerTextStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        ' Brigends Expanded',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                        ),
                                                      ),
                                                      child:
                                                          CupertinoDatePicker(
                                                        mode:
                                                            CupertinoDatePickerMode
                                                                .date,
                                                        minimumDate: DateTime
                                                            .fromMicrosecondsSinceEpoch(
                                                                1733007600000000),
                                                        initialDateTime: DateTime
                                                            .fromMicrosecondsSinceEpoch(
                                                                1733007600000000),
                                                        maximumDate:
                                                            DateTime(2050),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        use24hFormat: false,
                                                        onDateTimeChanged:
                                                            (newDateTime) =>
                                                                safeSetState(
                                                                    () {
                                                          _model.datePicked =
                                                              newDateTime;
                                                        }),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        text: 'Inserisci',
                                        options: FFButtonOptions(
                                          height: 30.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: const Color(0xC0CF3A0A),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Lato',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Descrizione',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Lato',
                                color: FlutterFlowTheme.of(context).tertiary,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: SizedBox(
                              width: 200.0,
                              child: TextFormField(
                                controller: _model.descriptionTextController,
                                focusNode: _model.descriptionFocusNode,
                                autofocus: false,
                                textCapitalization: TextCapitalization.words,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: ' Brigends Expanded',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  hintText: ' Descrizione dell\'evento',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: const Color(0xFFA09F99),
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xFFD8D8DD),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: const Color(0xFFA09F99),
                                      letterSpacing: 0.0,
                                    ),
                                maxLines: null,
                                maxLength: 1000,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model
                                    .descriptionTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Location',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Lato',
                                color: FlutterFlowTheme.of(context).tertiary,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 20.0),
                            child: StreamBuilder<List<LocationRecord>>(
                              stream: queryLocationRecord(
                                queryBuilder: (locationRecord) =>
                                    locationRecord.orderBy('DisplayName'),
                              )..listen((snapshot) {
                                  List<LocationRecord>
                                      locationDropDownLocationRecordList =
                                      snapshot;
                                  if (_model.locationDropDownPreviousSnapshot !=
                                          null &&
                                      !const ListEquality(
                                              LocationRecordDocumentEquality())
                                          .equals(
                                              locationDropDownLocationRecordList,
                                              _model
                                                  .locationDropDownPreviousSnapshot)) {
                                    () async {
                                      _model.locationReference =
                                          await queryLocationRecordOnce(
                                        queryBuilder: (locationRecord) =>
                                            locationRecord.where(
                                          'DisplayName',
                                          isEqualTo: _model
                                              .locationReference?.displayName,
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);

                                      safeSetState(() {});
                                    }();
                                  }
                                  _model.locationDropDownPreviousSnapshot =
                                      snapshot;
                                }),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitFadingCube(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<LocationRecord>
                                    locationDropDownLocationRecordList =
                                    snapshot.data!;

                                return FlutterFlowDropDown<String>(
                                  controller:
                                      _model.locationDropDownValueController ??=
                                          FormFieldController<String>(null),
                                  options: locationDropDownLocationRecordList
                                      .map((e) => e.displayName)
                                      .toList(),
                                  onChanged: (val) => safeSetState(
                                      () => _model.locationDropDownValue = val),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: const Color(0xFFA09F99),
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'es. Levante',
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Color(0xC0CF3A0A),
                                    size: 24.0,
                                  ),
                                  fillColor: const Color(0xFFD8D8DD),
                                  elevation: 2.0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 0.0,
                                  borderRadius: 16.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  hidesUnderline: true,
                                  isOverButton: false,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Tag event',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Lato',
                                color: FlutterFlowTheme.of(context).tertiary,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 20.0),
                            child: StreamBuilder<List<TagRecord>>(
                              stream: queryTagRecord(
                                queryBuilder: (tagRecord) =>
                                    tagRecord.orderBy('DispalyName'),
                              )..listen((snapshot) {
                                  List<TagRecord> tagDropDownTagRecordList =
                                      snapshot;
                                  if (_model.tagDropDownPreviousSnapshot !=
                                          null &&
                                      !const ListEquality(
                                              TagRecordDocumentEquality())
                                          .equals(
                                              tagDropDownTagRecordList,
                                              _model
                                                  .tagDropDownPreviousSnapshot)) {
                                    () async {
                                      _model.tagSelected =
                                          await queryTagRecordOnce(
                                        queryBuilder: (tagRecord) =>
                                            tagRecord.where(
                                          'DispalyName',
                                          isEqualTo: _model.tagDropDownValue,
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);

                                      safeSetState(() {});
                                    }();
                                  }
                                  _model.tagDropDownPreviousSnapshot = snapshot;
                                }),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitFadingCube(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<TagRecord> tagDropDownTagRecordList =
                                    snapshot.data!;

                                return FlutterFlowDropDown<String>(
                                  controller:
                                      _model.tagDropDownValueController ??=
                                          FormFieldController<String>(null),
                                  options: tagDropDownTagRecordList
                                      .map((e) => e.dispalyName)
                                      .toList(),
                                  onChanged: (val) => safeSetState(
                                      () => _model.tagDropDownValue = val),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: const Color(0xFFA09F99),
                                        letterSpacing: 0.0,
                                      ),
                                  hintText:
                                      'es. Indie, Techno, Al Aperto, Al Chiuso',
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Color(0xC0CF3A0A),
                                    size: 24.0,
                                  ),
                                  fillColor: const Color(0xFFD8D8DD),
                                  elevation: 2.0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 0.0,
                                  borderRadius: 16.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  hidesUnderline: true,
                                  isOverButton: false,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Link Instagram',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Lato',
                                color: FlutterFlowTheme.of(context).tertiary,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 20.0),
                            child: SizedBox(
                              width: 200.0,
                              child: TextFormField(
                                controller: _model.linksocialTextController,
                                focusNode: _model.linksocialFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: ' Brigends Expanded',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  hintText:
                                      'https://www.instagram.com/ilmioevento',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: const Color(0xFFA09F99),
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xFFD8D8DD),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: const Color(0xFFA09F99),
                                      letterSpacing: 0.0,
                                    ),
                                maxLines: null,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model
                                    .linksocialTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 40.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          var eventRecordReference =
                              EventRecord.collection.doc();
                          await eventRecordReference.set({
                            ...createEventRecordData(
                              images: _model.uploadedFileUrl,
                              name: _model.dispalyTitleTextController.text,
                              dateEvent: _model.datePicked,
                              description:
                                  _model.descriptionTextController.text,
                              location: _model.locationReference?.reference,
                            ),
                            ...mapToFirestore(
                              {
                                'social': [
                                  _model.linksocialTextController.text
                                ],
                                'organizers': [
                                  currentUserDocument?.organization
                                ],
                              },
                            ),
                          });
                          _model.eventCreated =
                              EventRecord.getDocumentFromData({
                            ...createEventRecordData(
                              images: _model.uploadedFileUrl,
                              name: _model.dispalyTitleTextController.text,
                              dateEvent: _model.datePicked,
                              description:
                                  _model.descriptionTextController.text,
                              location: _model.locationReference?.reference,
                            ),
                            ...mapToFirestore(
                              {
                                'social': [
                                  _model.linksocialTextController.text
                                ],
                                'organizers': [
                                  currentUserDocument?.organization
                                ],
                              },
                            ),
                          }, eventRecordReference);

                          await TicketModelsRecord.createDoc(
                                  _model.eventCreated!.reference)
                              .set(createTicketModelsRecordData(
                            name: 'Ingresso normale',
                            type: TicketType.Normale,
                            title: 'Ingresso normale',
                            description:
                                'ingresso classico senza bisogno di essere approvati',
                            price: 10.0,
                          ));

                          await TicketModelsRecord.createDoc(
                                  _model.eventCreated!.reference)
                              .set(createTicketModelsRecordData(
                            name: 'Ingresso vip',
                            type: TicketType.Vip,
                            title: 'Ingresso vip',
                            description:
                                'ingresso vip con bisogno di approvazione',
                            price: 15.0,
                          ));

                          await TableModelRecord.createDoc(
                                  _model.eventCreated!.reference)
                              .set(createTableModelRecordData(
                            name: ' Tavolo + bottiglia ',
                            title: 'Tavolo normale',
                            description:
                                'Tavolo + bottiglia un litro, chiama i tuoi amici e raggruppa fino a 10 persone',
                            price: 250.0,
                            type: TableType.TableNormal,
                          ));

                          await _model.eventCreated!.reference
                              .update(createEventRecordData());

                          context.pushNamed(
                            'OrganizationPage',
                            queryParameters: {
                              'organizationReference': serializeParam(
                                currentUserDocument?.organization,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );

                          safeSetState(() {});
                        },
                        text: 'Conferma',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xC0CF3A0A),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Lato',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
