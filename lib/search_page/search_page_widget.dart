import '/backend/backend.dart';
import '/components/nav_nuova/nav_nuova_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'search_page_model.dart';
export 'search_page_model.dart';

class SearchPageWidget extends StatefulWidget {
  const SearchPageWidget({super.key});

  @override
  State<SearchPageWidget> createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  late SearchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: Container(
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController',
                      const Duration(milliseconds: 2000),
                      () async {
                        safeSetState(() => _model.algoliaSearchResults = null);
                        await EventRecord.search(
                          term: _model.textController.text,
                          maxResults: 9,
                        )
                            .then((r) => _model.algoliaSearchResults = r)
                            .onError(
                                (_, __) => _model.algoliaSearchResults = [])
                            .whenComplete(() => safeSetState(() {}));
                      },
                    ),
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Cerca...',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Lato',
                                color: FlutterFlowTheme.of(context).primary,
                                letterSpacing: 0.0,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF5F5F5),
                      suffixIcon: const Icon(
                        Icons.search,
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: ' Brigends Expanded',
                          color: Colors.black,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    minLines: 1,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 100.0, 16.0, 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Location',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: ' Brigends Expanded',
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            ListView(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF5F5F5),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 12.0, 12.0, 12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 56.0,
                                              height: 56.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  'https://images.unsplash.com/photo-1521334726092-b509a19597c6?w=500&h=500',
                                                  width: 56.0,
                                                  height: 56.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Teatro San Carlo',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            ' Brigends Expanded',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                Text(
                                                  'Napoli, Italia',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ].divide(const SizedBox(width: 12.0)),
                                        ),
                                        Icon(
                                          Icons.chevron_right,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                      ].divide(const SizedBox(width: 12.0)),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 12.0)),
                            ),
                          ].divide(const SizedBox(height: 16.0)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Eventi',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: ' Brigends Expanded',
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            StreamBuilder<List<EventRecord>>(
                              stream: queryEventRecord(
                                limit: 2,
                              ),
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
                                List<EventRecord> rowEventRecordList =
                                    snapshot.data!;

                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(
                                        rowEventRecordList.length, (rowIndex) {
                                      final rowEventRecord =
                                          rowEventRecordList[rowIndex];
                                      return Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'EventPage',
                                              queryParameters: {
                                                'eventId': serializeParam(
                                                  rowEventRecord.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: 142.0,
                                            height: 174.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                            child:
                                                StreamBuilder<LocationRecord>(
                                              stream:
                                                  LocationRecord.getDocument(
                                                      rowEventRecord.location!),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child: SpinKitFadingCube(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }

                                                final columnLocationRecord =
                                                    snapshot.data!;

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        rowEventRecord.images,
                                                        width: 137.0,
                                                        height: 134.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Text(
                                                      rowEventRecord.name,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      columnLocationRecord
                                                          .displayName,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          ].divide(const SizedBox(height: 16.0)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Organizzazioni',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: ' Brigends Expanded',
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            StreamBuilder<List<OrganizationRecord>>(
                              stream: queryOrganizationRecord(
                                limit: 3,
                              ),
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
                                List<OrganizationRecord>
                                    listViewOrganizationRecordList =
                                    snapshot.data!;

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewOrganizationRecordList.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 12.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewOrganizationRecord =
                                        listViewOrganizationRecordList[
                                            listViewIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'OrganizationPage',
                                          queryParameters: {
                                            'organizationReference':
                                                serializeParam(
                                              listViewOrganizationRecord
                                                  .reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 12.0, 12.0, 12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 56.0,
                                                    height: 56.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              28.0),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              28.0),
                                                      child: Image.network(
                                                        listViewOrganizationRecord
                                                            .logo,
                                                        width: 56.0,
                                                        height: 56.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        listViewOrganizationRecord
                                                            .name,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      ' Brigends Expanded',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ].divide(const SizedBox(width: 12.0)),
                                              ),
                                              Icon(
                                                Icons.chevron_right,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                            ].divide(const SizedBox(width: 12.0)),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ].divide(const SizedBox(height: 16.0)),
                        ),
                      ),
                    ].divide(const SizedBox(height: 24.0)),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.03, 1.0),
                child: ClipRRect(
                  child: Container(
                    width: double.infinity,
                    height: 111.0,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: wrapWithModel(
                      model: _model.navNuovaModel,
                      updateCallback: () => safeSetState(() {}),
                      child: const NavNuovaWidget(
                        pA: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
