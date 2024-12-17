import '/backend/backend.dart';
import '/components/nav_nuova/nav_nuova_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'home_location_page_model.dart';
export 'home_location_page_model.dart';

class HomeLocationPageWidget extends StatefulWidget {
  const HomeLocationPageWidget({super.key});

  @override
  State<HomeLocationPageWidget> createState() => _HomeLocationPageWidgetState();
}

class _HomeLocationPageWidgetState extends State<HomeLocationPageWidget> {
  late HomeLocationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeLocationPageModel());

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
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
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
              context.pop();
            },
          ),
          title: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
            child: Text(
              'FRESKO',
              style: FlutterFlowTheme.of(context).displayLarge.override(
                    fontFamily: ' Brigends Expanded',
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'scopri',
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: ' Brigends Expanded',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 480.0,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child:
                                          StreamBuilder<List<LocationRecord>>(
                                        stream: queryLocationRecord(),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child: SpinKitFadingCube(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<LocationRecord>
                                              gridViewLocationRecordList =
                                              snapshot.data!;

                                          return GridView.builder(
                                            padding: const EdgeInsets.fromLTRB(
                                              0,
                                              10.0,
                                              0,
                                              10.0,
                                            ),
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 10.0,
                                              mainAxisSpacing: 10.0,
                                              childAspectRatio: 1.0,
                                            ),
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                gridViewLocationRecordList
                                                    .length,
                                            itemBuilder:
                                                (context, gridViewIndex) {
                                              final gridViewLocationRecord =
                                                  gridViewLocationRecordList[
                                                      gridViewIndex];
                                              return Container(
                                                width: 100.0,
                                                height: 127.0,
                                                decoration: const BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'LocationPage',
                                                          queryParameters: {
                                                            'locationRef':
                                                                serializeParam(
                                                              gridViewLocationRecord
                                                                  .reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          gridViewLocationRecord
                                                              .image
                                                              .firstOrNull!,
                                                          width: 170.0,
                                                          height: 150.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      gridViewLocationRecord
                                                          .name,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                      pA: 4,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
